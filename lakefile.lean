import Lake
open Lake DSL

package «idol-theses» where
  version := v!"0.1.0"
  moreLeanArgs := #["-DwarningAsError=true"]

@[default_target]
lean_lib IdolTheses where
  roots := #[
    `Merge,
    `Fold,
    `Frontier,
    `Cited,
    `IdolTheses
  ]
