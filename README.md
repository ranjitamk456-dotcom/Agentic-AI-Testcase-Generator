# Agentic AI Test Case Generator

## Overview

This project is an Agentic AI Test Case Generator implemented in a single Google Colab notebook.

The agent reads a software requirement and Acceptance Criteria, generates test cases, critiques the generated suite, improves it, structures the final test cases, performs deterministic validation, checks coverage, identifies coverage gaps, and exports final artifacts.

## Features

### Feature A - User Login
The test suite covers:
- Valid login
- Invalid password
- Unregistered email
- Empty fields
- Email format validation
- Account lockout
- Case sensitivity
- Session handling
- Inactive account

### Feature B - Apply Promo Code at Checkout
The test suite covers:
- Valid percentage discount
- Valid fixed discount
- Minimum order validation
- Expired codes
- Invalid codes
- Case-insensitive codes
- Already-used codes
- Discount limits
- Replacing an existing promo code
- Empty input
- Whitespace handling
- Cart-change recalculation

## Agentic Workflow

The notebook follows this sequence:

1. Load requirements and Acceptance Criteria.
2. Generate an initial test suite.
3. Critique the generated test suite.
4. Improve the test suite based on the critique.
5. Structure the final test cases.
6. Run deterministic QA validation.
7. Generate coverage reports.
8. Identify coverage gaps.
9. Produce feature summaries.
10. Complete Feature A before starting Feature B.
11. Produce the combined final summary.
12. Export project artifacts.

The Generate -> Critique -> Improve loop is the main agentic component of the project.

## Execution Order

The notebook is intentionally organized so that Feature A completes fully before Feature B begins.

Feature A:
Requirement -> Acceptance Criteria -> Generate -> Critique -> Improve -> Structure -> Validation -> Coverage -> Summary

Feature B:
Requirement -> Acceptance Criteria -> Generate -> Critique -> Improve -> Structure -> Validation -> Coverage -> Summary

Finally, the notebook creates the combined outputs.

## External Input Files

Only the following editable files are required outside the notebook:

- `feature_a_acceptance_criteria.json`
- `feature_b_acceptance_criteria.json`

These files contain the Acceptance Criteria used by the notebook.

## Requirements

Each generated test case should contain:

- Test Case ID
- Acceptance Criteria
- Category
- Scenario
- Preconditions
- Test Data
- Steps
- Expected Result
- Priority
- Risk

Allowed categories:
- Positive
- Negative
- Boundary
- Edge

Allowed priorities:
- P0
- P1
- P2
- P3

Allowed risks:
- High
- Medium
- Low

## Model and API

The notebook uses Groq API access and the configured model:

`openai/gpt-oss-120b`

The API key should be supplied securely in Google Colab, preferably through Colab Secrets using the name:

`GROQ_API_KEY`

Do not hard-code the API key into the notebook.

## Running the Project

1. Open the `.ipynb` notebook in Google Colab.
2. Upload the two Acceptance Criteria JSON files when requested.
3. Configure the `GROQ_API_KEY` in Colab Secrets.
4. Run the notebook from top to bottom.
5. Do not skip the common setup/function cells.
6. Allow Feature A to complete before Feature B begins.
7. Review the validation and coverage results.
8. Check the generated files in the output directory.

## Generated Artifacts

The notebook can generate:

- `final_test_suite.csv`
- `validation_feature_a.csv`
- `validation_feature_b.csv`
- `execution_feature_a.csv`
- `execution_feature_b.csv`
- `coverage_report.csv`
- `coverage_gaps.csv`
- `final_summary.csv`
- `PROMPT_EXPLANATION.md`
- `DESIGN_WRITEUP.md`

The exact artifacts depend on the variables available after successful notebook execution.

## Validation

The deterministic QA gate checks the generated test-suite structure and data quality, including:

- Required columns
- Test Case ID
- Acceptance Criteria format
- Scenario
- Steps
- Expected Result
- Category
- Priority
- Risk
- Duplicate test case IDs
- Coverage information

Empty optional fields should not automatically be treated as a failure unless the corresponding validation rule requires the field.

## Important Scope Note

This project does not contain a real login or checkout application/API to execute against.

Therefore, the execution phase validates the generated test-suite artifacts rather than claiming that the actual application functionality passed or failed.

A real System Under Test can be connected later without changing the Acceptance Criteria files.

## Troubleshooting

### FileNotFoundError for Acceptance Criteria JSON

Make sure both JSON files are uploaded to the Colab runtime and that the filenames exactly match:

`feature_a_acceptance_criteria.json`

`feature_b_acceptance_criteria.json`

If the runtime was restarted, upload the files again.

### NameError for a function such as extract_json_array

Run the notebook from the beginning so that all common helper functions are defined before the Feature A and Feature B execution sections.

### Groq API or model error

Check that:
- `GROQ_API_KEY` is available.
- The API key is valid.
- The selected model is available to the account.
- Rate limits have not been exceeded.

If a rate-limit error occurs, wait and rerun the affected cell rather than changing the project flow.

## Project Structure

The intended project structure is:

```text
Agentic_AI_Test_Case_Generator/
|
|-- Agentic_AI_Test_Case_Generator_Organized_Working.ipynb
|-- feature_a_acceptance_criteria.json
|-- feature_b_acceptance_criteria.json
|-- README.md
|-- REQUIREMENT.txt
|
`-- capstone_outputs/
    |-- final_test_suite.csv
    |-- validation_feature_a.csv
    |-- validation_feature_b.csv
    |-- execution_feature_a.csv
    |-- execution_feature_b.csv
    |-- coverage_report.csv
    |-- coverage_gaps.csv
    `-- final_summary.csv
```

## Submission

Before submission, verify that:

- The notebook opens successfully.
- The notebook runs from top to bottom.
- Both Acceptance Criteria JSON files are available.
- Feature A completes before Feature B starts.
- The final test suite is generated.
- Validation results are available.
- Coverage reports are generated.
- Coverage gaps are reported.
- Final summary is generated.
- Required output files are present.
- No API key is exposed in the notebook.

## Author

Agentic AI Capstone Project - Test Case Generator
