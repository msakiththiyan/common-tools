package analyzer

import (
	"tdat-backend/internal/parser"

	"github.com/hyperjumptech/grule-rule-engine/ast"
	"github.com/hyperjumptech/grule-rule-engine/builder"
	"github.com/hyperjumptech/grule-rule-engine/engine"
	"github.com/hyperjumptech/grule-rule-engine/pkg"
)

type RuleEngine struct {
	KnowledgeLibrary *ast.KnowledgeLibrary
}

// NewEngine initializes Grule and loads the GRL file
func NewEngine(ruleFilePath string) (*RuleEngine, error) {
	lib := ast.NewKnowledgeLibrary()
	ruleBuilder := builder.NewRuleBuilder(lib)

	// Load the rules from the file system
	err := ruleBuilder.BuildRuleFromResource("ThreadRules", "0.0.1", pkg.NewFileResource(ruleFilePath))
	if err != nil {
		return nil, err
	}

	return &RuleEngine{
		KnowledgeLibrary: lib,
	}, nil
}

// AnalyzeThreads applies the rules to a slice of threads
func (e *RuleEngine) AnalyzeThreads(threads []parser.Thread, usageDataProvided bool) error {
	// Get the KnowledgeBase from the library
	kb, err := e.KnowledgeLibrary.NewKnowledgeBaseInstance("ThreadRules", "0.0.1")
	if err != nil {
		return err
	}

	if !usageDataProvided {
		// If no external usage file, infer CPU from header attributes with the formula (CPUTimeMS / ElapsedTimeMS) * 100
		for i := range threads {
			t := &threads[i]
			// Ensure elapsed time is > 0 to avoid division by zeroNaN
			// ElapsedTime is s, convert to ms.
			elapsedMs := t.ElapsedTime * 1000.0
			if elapsedMs > 0 && t.CPUTime > 0 {
				t.CPUPercentage = (t.CPUTime / elapsedMs) * 100.0
			} else {
				t.CPUPercentage = 0.0
			}
		}
	}

	// Calculate Global Stats
	stats := &parser.GlobalStats{
		TotalThreads:        len(threads),
		IsUsageDataProvided: usageDataProvided,
	}
	blockedCount := 0
	for _, t := range threads {
		if t.State == "BLOCKED" {
			blockedCount++
		}
	}
	if len(threads) > 0 {
		stats.BlockedPercentage = (float64(blockedCount) / float64(len(threads))) * 100.0
	}

	// Run Engine Per Thread
	for i := range threads {
		t := &threads[i]

		// Context contains BOTH the thread and the global stats
		dataCtx := ast.NewDataContext()

		// "t" and "global" must match the variable names in rules.grl
		err := dataCtx.Add("t", t)
		if err != nil {
			return err
		}
		err = dataCtx.Add("global", stats)
		if err != nil {
			return err
		}

		ruleEngine := engine.NewGruleEngine()
		if err := ruleEngine.Execute(dataCtx, kb); err != nil {
			return err
		}
	}
	return nil
}
