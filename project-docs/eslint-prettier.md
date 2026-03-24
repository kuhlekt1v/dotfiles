# Code Quality Setup: ESLint + Prettier

This project uses **ESLint** and **Prettier** to enforce consistent code quality and formatting across the team.

The goal is simple:
> Make clean code the default, not something we argue about in PRs.

---

## Tooling Overview

| Tool        | Responsibility                          |
|------------|----------------------------------------|
| ESLint      | Code correctness, best practices       |
| Prettier    | Code formatting                        |
| Husky       | Pre-commit hooks                       |
| lint-staged | Runs checks only on staged files       |

---

## Installation

Install all required dependencies in codebase:

```bash
npm install -D eslint prettier \
  @typescript-eslint/parser @typescript-eslint/eslint-plugin \
  eslint-plugin-react eslint-plugin-react-hooks \
  eslint-plugin-jsx-a11y \
  eslint-config-prettier eslint-plugin-prettier \
  husky lint-staged
```

Initialize husky
`npx hust init`

---

## Configuration

### ESLint (.eslintrc.ts)
```javascript
import js from '@eslint/js';
import tseslint from 'typescript-eslint';
import react from 'eslint-plugin-react';
import reactHooks from 'eslint-plugin-react-hooks';
import jsxA11y from 'eslint-plugin-jsx-a11y';
import prettier from 'eslint-plugin-prettier';

export default [
  {
    ignores: ['node_modules', 'dist', 'build'],
  },
  js.configs.recommended,
  ...tseslint.configs.recommended,
  {
    files: ['**/*.{js,jsx,ts,tsx}'],
    plugins: {
      '@typescript-eslint': tseslint.plugin,
      react,
      'react-hooks': reactHooks,
      'jsx-a11y': jsxA11y,
      prettier,
    },
    languageOptions: {
      parser: tseslint.parser,
      parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        ecmaFeatures: {
          jsx: true,
        },
      },
      globals: {
        // Add global variables here if needed
      },
    },
    settings: {
      react: {
        version: 'detect',
      },
    },
    rules: {
      'prettier/prettier': 'error',

      'react/react-in-jsx-scope': 'off',
      'react/prop-types': 'off',

      '@typescript-eslint/no-unused-vars': [
        'warn',
        { argsIgnorePattern: '^_' },
      ],
      '@typescript-eslint/no-explicit-any': 'off',
    },
  },
];
```

### Prettier (.prettierrc)
```json
{
  "semi": true,
  "singleQuote": true,
  "trailingComma": "all",
  "printWidth": 100,
  "tabWidth": 2
}
```

### Ignore Files

#### .eslintignore
```bash
node_modules
dist
build
```

#### .prettierignore
```bash
node_modules
dist
build
```

---

## Scripts
Add to `package.json`

```json
{
  "scripts": {
    "lint": "eslint . --ext .ts,.tsx",
    "lint:fix": "eslint . --ext .ts,.tsx --fix",
    "format": "prettier . --write"
  }
}
```

---

## Pre-Commit Enforcement (Required)
We enforce code quality before commits using **Husky** & **lint-staged**.

### package.json
```json
{
  "lint-staged": {
    "*.{ts,tsx,js,jsx}": [
      "eslint --fix",
      "prettier --write"
    ]
  }
}
```

### .husky/pre-commit
`npx lint-staged`

#### What this does:
- Automatically fixes lint issues
- Formats code
- Prevents bad code from being committed

---

## Rules & Philosophy
1. Prettier owns formatting
   - No debates about spacing, quotes, etc.
   - Do not add formatting rules to ESLint
2. ESLint owns correctness
   - Prevent bugs
   - Enforce React + TypeScript best practices
3. Automation over manual effort 
   - Formatting and fixes happen automatically
   - PRs should not contain style discussions
4. Consistency > personal preference
   - All editors should produce identical output
   - CLI is the source of truth

---

## Workflow
### Before committing:
Code is automatically linted and formatted

### If something fails:
Run the following, full-project cleanup commands

```bash
npm run lint:fix
npm run format
```

#### npm run lint:fix
`eslint . --ext .ts,.tsx --fix`

**What it does:**
- Runs ESLint on entire codebase
- Fixes all auto-fixable issues

**When you use it:**
- After pulling messy code
- After changing ESLint rules
- Before a big PR
- When things feel “off”

#### npm run format
`prettier . --write`

**What it does:**
- Formats every file in the project

**When you use it:**
- First-time setup
- After changing Prettier config
- To normalize the repo
