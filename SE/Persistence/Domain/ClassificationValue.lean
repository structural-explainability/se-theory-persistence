/-
Copyright (c) 2026 Denise M. Case.
Released under MIT license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

set_option autoImplicit false

/-!
# Classification Value

SE.Persistence.Domain.ClassificationValue

The values a persistence classification takes at an *applicable*
transformation.

Inapplicability is not a value. It is the absence of a classification, and is
represented by `none` in `SE.Persistence.Classification.pattern`.
-/

namespace SE.Persistence

public section

-- RR.DEFINES: PS.TYPE.CLASSIFICATION_VALUE
/--
Identity-persistence classification of an applicable transformation relative
to one criterion of identity.

- `ign`: applicable and identity-ignoring (written IGN in the papers, and
  NEU in SE-200).
- `prs`: applicable and identity-preserving.
- `brk`: applicable and identity-breaking.

Inapplicable (N/A) is deliberately not a constructor; see
`SE.Persistence.Classification`.
-/
inductive ClassificationValue where
  | ign
  | prs
  | brk
deriving DecidableEq, Repr

end

end SE.Persistence
