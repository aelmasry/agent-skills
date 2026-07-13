# Refactor without changing behavior

Use skill: `code-simplification`.

## Target
<!-- file, module, or pattern to simplify -->

## Rules
- No behavior changes — tests must stay green
- Prefer deleting code over adding abstractions
- Match existing project conventions
- One focused refactor per pass

## Instructions

1. Read the target code and its tests
2. List smells (duplication, deep nesting, unclear names)
3. Apply the smallest simplification that improves clarity
4. Run tests after each change
5. Summarize what improved and what you intentionally left alone
