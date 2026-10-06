# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

### Planned

- Interaction of classification with transformation composition and orthogonality
- Patterns of applicability and classification, and split pressure
- Carrier-sensitive separation of classifications

---

## [0.2.0] - 2026-10-06

### Added

- Generic observational equivalence and the full characterization of generated
  equivalence by all step invariants, including the classification-level result.
- Preservation equivalence and observational completeness via invariant
  saturation, without selecting carrier or identity basis semantics.

---

## [0.1.1] - 2026-10-06

### Fixed

- Aligned the semantic Transformation dependency declaration with the existing
  `v0.5.1` Lake pin and documented the taxonomy-only integration boundary.
- Corrected reference-tool command names, public-source and clone paths, the
  documentation workflow link, and the release-validation snapshot directory.
- Removed the manifest summary's unsupported admissibility qualifier; formal
  definitions and proofs are unchanged.

---

## [0.1.0] - 2026-10-03

### Added

- Initial Lean 4 formalization of foundational persistence theory under `SE.Persistence`.
- `ClassificationValue` (`ign`, `prs`, `brk`) and `Classification`, which records
  applicability and class together as `T → Option ClassificationValue`.
  Inapplicable is the absence of a value, so it is structurally distinct from `ign`.
- `Classification.coarse`, the total matrix that sends inapplicable to `ign`, with
  proofs that it preserves the preserving and breaking sets.
- `Dynamics` and `freeDynamics`, with the generic closures `Reach` (directed) and
  `Generated` (equivalence).
- Directed survival (`Survives`), the identity relation (`identityRel`), breakage
  (`stepBrk`), and persistence invariants (`Invariant`).
- Theorems: `identityRel` is an equivalence generated only by preserving steps;
  survival implies identity; invariance under preserving steps is respect for the
  identity relation; classifications with equal preserving sets never separate,
  and on the free dynamics the converse holds; survival is strictly weaker than
  the identity relation; a breaking step can connect identity-related states.
- `SE.Persistence.Reference.Lift`, which lifts family-level and kind-level
  classifications to operator codes through the Transformation theory.
- `Registry` and `Conformance` finite guards, `Spec` citation identifiers, and the
  Lean test suite under `SETest/Persistence`.
- Reference artifacts: `theory-reference.toml` and the type, vocabulary,
  predicate, and theorem registries.

### Notes

- Persistence depends only on the Transformation theory, and only through `Lift`.
- Persistence defines no identity regimes, regime profiles, carriers, or
  admissibility notion. Those belong downstream.

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** - breaking changes to formal surface or validation semantics
  - **MINOR** - backward-compatible additions to theory vocabulary or artifacts
  - **PATCH** - fixes, documentation, tooling
- Versions are driven by git tags. Tag `vX.Y.Z` to release.
- During `0.x` development, breaking formal-surface changes
  may occur in a **MINOR** release.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### Optional: One-Time Zenodo Authorization

1. Sign in to Zenodo.
2. Open your profile menu in the upper-right.
3. Select GitHub.
4. Click Sync now.
5. Find structural-explainability/ this repo.
6. Turn on the repository toggle/slider.
7. Refresh the page and confirm it appears as enabled.
8. Zenodo will ingest future GitHub Releases from this repo.

### Task 1. Update release metadata (manual edits)

1.1. CITATION.cff: update version and date-released
1.2. lakefile.toml: update version
1.3. CHANGELOG.md: add section, move unreleased entries, update links
1.4. pyproject.toml: update version (near top of the file)

### Task 2. Set up and Validate

```shell
# set up or update Python environment
# Run repository checks.
.\sit.ps1

# Update GitHub Actions and pin all action references to immutable SHAs.
uvx gha-tools autoupdate --pin=all --write .github/workflows

# Audit the resulting GitHub configuration for security findings.
# NO .github\workflows\deploy-zensical.yml
# YES  .github\workflows\deploy-zensical-lean.yml
uvx zizmor@latest .github/

# Validate.
uvx cffconvert --validate
uvx se-manifest-schema validate-manifest --strict

# Format Markdown.
npx markdownlint-cli2 --fix

# update lean
elan self update
lake update

# build Lean (source of truth)
# lake clean
lake build
lake test
lake lint

# check docs (may not work on windows/runs via gh action)
# cd docbuild
# lake build SE.Persistence:docs
# cd ..

# Generate JSON artifacts and catalog from reference TOML.
uvx se-theory-reference-kit@latest inspect
uvx se-theory-reference-kit@latest export
uvx se-theory-reference-kit@latest catalog

# Validate the reference artifacts against the Lean public surface.
uvx se-theory-reference-kit@latest validate --strict

# Verify generated artifacts are current without rewriting them.
uvx se-theory-reference-kit@latest export --check
uvx se-theory-reference-kit@latest catalog --check

.\rel.ps1
.\sit.ps1
```

Review all generated and modified files before committing.

### Task 3. Commit and Push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify that all required GitHub Actions complete successfully.

### Task 4. Tag and Push the Release

After the required GitHub Actions succeed:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

Create GitHub Release after pushing tag, for example with a command like this:

```shell
gh release create v0.2.0 --verify-tag --title "0.2.0"  --generate-notes
```

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/structural-explainability/se-theory-persistence/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/structural-explainability/se-theory-persistence/releases/tag/v0.1.1
[0.1.0]: https://github.com/structural-explainability/se-theory-persistence/releases/tag/v0.1.0
