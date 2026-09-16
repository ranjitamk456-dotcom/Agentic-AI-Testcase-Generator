
# Agentic AI Test Case Generator — Design Writeup

## 1. Problem Statement

The project demonstrates an Agentic AI Test Case Generator that
converts software requirements and Acceptance Criteria into
requirement-traceable QA test cases.

The project covers:

1. User Login
2. Apply Promo Code at Checkout

The generated test suites cover:

- Positive scenarios
- Negative scenarios
- Boundary scenarios
- Edge scenarios

Each test case is mapped to the relevant Acceptance Criterion.

## 2. Project Objective

The objective is to demonstrate how Agentic AI can support QA
engineers in generating comprehensive test scenarios while
maintaining requirement traceability and deterministic validation.

The overall workflow is:

Generate
→ Critique
→ Improve
→ Structure
→ Validate
→ Execute / QA Gate
→ Coverage Analysis
→ Reporting
→ Export

## 3. Architecture

The complete implementation is maintained in a single
Google Colab/Jupyter notebook.

The notebook contains:

- Common setup
- Agent implementation
- Generation logic
- Critique logic
- Improvement logic
- Test-case structuring
- Deterministic validation
- Execution / QA gate
- Coverage analysis
- Reporting
- Final artifact generation

The only external editable inputs are:

- feature_a_acceptance_criteria.json
- feature_b_acceptance_criteria.json

## 4. Feature Execution Order

Feature A — User Login is completed through its complete workflow
before Feature B begins.

Feature A includes:

Requirement
→ Acceptance Criteria
→ Generate
→ Critique
→ Improve
→ Structure
→ Validate
→ Execute / QA Gate
→ Coverage
→ Reporting
→ Final Summary

Only after Feature A is completed does Feature B start.

Feature B follows the same complete workflow.

Combined reporting occurs only after both features are completed.

## 5. Agentic Workflow

### Generator Agent

Generates the initial test suite from the requirement and Acceptance
Criteria.

The generator considers:

- Positive scenarios
- Negative scenarios
- Boundary scenarios
- Edge scenarios
- Business rules
- Thresholds
- Timing conditions
- State changes
- Priorities
- Risks
- Requirement traceability

### Critic Agent

Reviews the generated test suite and identifies:

- Missing Acceptance Criteria coverage
- Missing scenarios
- Category gaps
- Boundary gaps
- Edge cases
- Weak expected results
- Duplicate scenarios
- Traceability issues
- Unsupported assumptions

### Improver Agent

Uses the critic feedback to improve the test suite while preserving
the supplied requirements.

## 6. Deterministic Validation

Python-based deterministic validation is applied after AI generation.

Validation includes:

- Required columns
- Test Case IDs
- Duplicate IDs
- Acceptance Criteria format
- Acceptance Criteria traceability
- Scenario presence
- Test steps
- Expected results
- Categories
- Priorities
- Risks
- Category coverage
- Acceptance Criteria coverage

This provides a repeatable quality gate independent of LLM reasoning.

## 7. Test Execution

The current project does not contain a real application, API, or
browser-based System Under Test.

Therefore, the project does not fabricate functional application
PASS/FAIL results.

The execution stage performs a deterministic QA gate against the
generated test-suite artifacts.

The execution results therefore represent generated-artifact
validation rather than functional execution against a real
application.

## 8. Coverage and Traceability

Each test case is mapped to an Acceptance Criterion.

Coverage reporting identifies:

- Covered Acceptance Criteria
- Test cases mapped to each criterion
- Category coverage
- Coverage gaps

This provides requirement traceability and supports QA review.

## 9. Human Review

The Agentic AI system supports QA engineers but does not replace
human QA judgment.

Human review remains important for:

- Business intent
- Requirement ambiguity
- Risk interpretation
- Environment-specific data
- Application-specific behavior
- Automation feasibility
- Unsupported assumptions
- Final test-suite suitability

## 10. Limitations

1. AI-generated test cases require human review.
2. LLM output may vary between executions.
3. No real System Under Test is included.
4. Functional application PASS/FAIL results cannot be claimed without
   an actual application, API, or browser target.
5. Environment-specific behavior requires the target environment.
6. Deterministic validation does not replace functional testing.

## 11. Final Outputs

The notebook generates the submission artifacts from the completed
Feature A and Feature B workflows.

Expected outputs include:

- final_test_suite.csv
- validation_feature_a.csv
- validation_feature_b.csv
- category_coverage.csv
- coverage_report.csv
- coverage_gaps.csv
- execution_feature_a.csv
- execution_feature_b.csv
- final_summary.csv
- DESIGN_WRITEUP.md
- Agentic_AI_Capstone_Reflection.pdf

The implementation remains in the single notebook.

The only external editable inputs are the two Acceptance Criteria
JSON files.

## 12. Conclusion

The project demonstrates an end-to-end Agentic AI QA workflow that
transforms requirements and Acceptance Criteria into structured,
categorized, requirement-traceable test suites.

The Generate → Critique → Improve workflow provides iterative AI
assistance, while deterministic validation provides repeatable
structural quality controls.

Feature A is completed before Feature B begins, and combined
reporting occurs only after both features are complete.
