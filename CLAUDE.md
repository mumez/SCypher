# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SCypher is an extensible, dynamic Cypher (Neo4j query language) query builder written in Smalltalk (Pharo/Squeak), stored as Tonel files. It builds Cypher query strings via a fluent, composable object API instead of string templating. It's designed for use with Neo4reSt and SCypherGraph.

## Development Commands

This is a Tonel-based Smalltalk project (`src` is `repository`, per `.project`). There is no CLI build/test — development happens by importing/exporting Tonel files against a running Pharo/Squeak image via the `smalltalk-dev` skills:

- Import all packages into the image and run tests: use the `st-reload` skill.
- Import a single package after editing `.st` files: use the `st-import` skill.
- Run SUnit tests: use the `st-test` skill (all tests are in `SCypher-Tests`, currently `CyCypherGenerationTest`).
- Validate/lint `.st` syntax before importing: use `st-validate` / `st-lint`.
- Export changes made directly in the image back to Tonel: use `st-export`.

Loading via Metacello (for consumers, not needed for local dev):
```smalltalk
Metacello new
  baseline: 'SCypher';
  repository: 'github://mumez/SCypher/repository';
  load.
```

## Architecture

### Package layout (`repository/`)
- `BaselineOfSCypher` — Metacello baseline; `SCypher-Core` has no deps, `SCypher-Tests` requires `SCypher-Core`.
- `SCypher-Core` — all query-building classes plus extension methods on `Dictionary`, `Object`, `OrderedCollection`, `SequenceableCollection`, `Set`, `String` (e.g. `asCypherIdentifier`, `asCypherParameter`, `cypherTokenString`).
- `SCypher-Tests` — SUnit tests that assert generated Cypher strings against expected literal output (`CyCypherGenerationTest`).

### Core object model
Everything is a `CyObject` (root of the class hierarchy, prefix `Cy`). Key traits inherited from `CyObject`:
- `value`, `identifier`, `alias` instance vars, with class-side factories `identifier:`, `value:`, `alias:`, `of:`, `name:`.
- Cypher string rendering is token-based, not direct string concatenation: every object implements `tokensOn: tokens` to append onto a `CyTokenCollection`; `cypherString`/`printCypherOn:` drive this via `tokenArray`. When adding new node types, implement `tokensOn:` rather than overriding `cypherString` directly.
- Operator overloading builds expressions: `=`, `<`, `>`, `,` (concatenation into `CyObjects`), `&`/`|` (boolean combination), `@` (property access), `-`/`->`/`<-` (relationship/path building) are defined on `CyObject`/`CyExpression`/`CyPatternElement` rather than named methods, mirroring Cypher's own syntax.
- Comparison/function shortcuts (`equals:`, `contains:`, `count`, `labels`, etc.) delegate to `expressionClass` (`CyExpression`) or build a `CyFuncInvocation` — new comparison operators or built-in functions should follow this same delegation pattern instead of hand-rolling token output.

### Query assembly (`CyQuery`)
- A `CyQuery` holds an ordered list of `statements` (each a `CyClause`/`CyCommand` subclass like `CyMatch`, `CyWhere`, `CyReturn`, `CySet`, `CyCreate`, `CyMerge`, `CyDelete`, `CyRemove`, `CyUnwind`, `CyWith`).
- Each clause type has a matching `addXxx:`/`addXxx:in:` pair on `CyQuery`: the plain form appends the clause, the `in:` form additionally yields the newly built clause to a block for further configuration (e.g. `orderBy:`, `skip:`, `limit:` on a `CyReturn`). Follow this same pair-of-methods convention when adding a new clause type.
- `CyQuery class` also exposes long "shortcut" constructors (e.g. `match:where:return:in:`, `matchPathWithRelationshipsOfTypes:...`) that compose multiple clauses in one call for common query shapes — these build on the lower-level `addXxx:` methods, they don't bypass them.
- `keyword` for a clause defaults to its class name minus the `Cy` prefix, uppercased (`CyClause >> defaultKeyword`), so naming a new clause class `CyFoo` gives it the `FOO` keyword for free.

### Style and workflow rules (from repository CLAUDE.md history)
- When editing `.st` files, consult the `smalltalk-developer` skill (especially its style guide).
- When debugging, consult the `smalltalk-debugger` skill (troubleshooting / UI debugging sections).
- Follow TDD; every new feature must have SUnit test coverage in `SCypher-Tests` before being considered done.
- Keep changes surgical and minimal — don't add abstractions beyond what's asked, don't touch unrelated code.
- Document in English; class/method/variable names must be intentional and revealing (long names are fine); keep DRY.
