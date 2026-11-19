#!/bin/sh
# The family check gate, strengthened to cover every Lean file in
# the repository: a file that is not on the compile list fails the
# gate, so no file can stand outside it.
set -eu
cd "$(dirname "$0")"
LEAN="${LEAN:-lean}"
export LEAN_PATH=".:${LEAN_PATH:-}"

# Reject every proof escape hatch, including ones the compiler
# would only warn about.
if grep -En '(^|[^[:alnum:]_])(sorry|admit|axiom|native_decide|implemented_by|extern|unsafe|opaque|partial)([^[:alnum:]_]|$)' ./*.lean; then
  echo "Rejected prohibited proof escape hatch" >&2
  exit 1
fi

# The compile list, in dependency order. Every .lean file in the
# repository must appear here exactly once.
FILES="lakefile.lean Merge.lean Fold.lean Frontier.lean SolverDominance.lean Synthesis.lean Cited.lean IdolTheses.lean Audit.lean"
for f in ./*.lean; do
  base="$(basename "$f")"
  case " $FILES " in
    *" $base "*) ;;
    *) echo "Lean file outside the gate: $base" >&2; exit 1 ;;
  esac
done

CHECK_TMP="$(mktemp)"
AUDIT_TMP="$(mktemp)"
trap 'rm -f "$CHECK_TMP" "$AUDIT_TMP"' EXIT HUP INT TERM
run_lean() {
  if "$LEAN" -DwarningAsError=true "$@" >"$CHECK_TMP" 2>&1; then
    cat "$CHECK_TMP"
  else
    cat "$CHECK_TMP"
    return 1
  fi
  if grep -Eq 'sorryAx|error:|warning:' "$CHECK_TMP"; then
    echo "Rejected checker diagnostics/admitted axiom" >&2
    return 1
  fi
}
"$LEAN" --version
run_lean lakefile.lean
run_lean -o Merge.olean Merge.lean
run_lean -o Fold.olean Fold.lean
run_lean -o Frontier.olean Frontier.lean
run_lean -o SolverDominance.olean SolverDominance.lean
run_lean -o Synthesis.olean Synthesis.lean
run_lean -o Cited.olean Cited.lean
run_lean -o IdolTheses.olean IdolTheses.lean

# The axiom audit: printouts may name only the standard three.
if "$LEAN" -DwarningAsError=true Audit.lean >"$AUDIT_TMP" 2>&1; then
  cat "$AUDIT_TMP"
else
  cat "$AUDIT_TMP"
  exit 1
fi
if grep -Eq 'sorryAx|error:|warning:' "$AUDIT_TMP"; then
  echo "Rejected checker diagnostics/admitted axiom" >&2
  exit 1
fi
AXIOMS="$(grep -o 'depends on axioms: \[[^]]*\]' "$AUDIT_TMP" \
  | sed 's/depends on axioms: \[//; s/\]//' | tr ',' '\n' \
  | sed 's/^ *//; s/ *$//' | sort -u)"
for a in $AXIOMS; do
  case "$a" in
    propext|Classical.choice|Quot.sound) ;;
    *) echo "Axiom outside the allowed set: $a" >&2; exit 1 ;;
  esac
done
echo "check: all files green; axioms within the allowed set"
