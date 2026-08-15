#!/usr/bin/env bash
#
# Both gates kanidm's "Linting checks" workflow runs (.github/workflows/clippy.yml): clippy and
# rustfmt, as two separate jobs. `ws lint` has to cover both or it reports a green that CI will
# contradict — a branch can pass clippy locally and go red on every commit for formatting alone.
#
# A wrapper rather than an inline `&&` because the realm adapter execs a whitespace-split argv
# with no shell. Wired in as `commands.lint`; `ws fmt` (commands.fmt) is the writing counterpart.
#
# Run from the component directory — `ws lint` cds there. Extra args go to clippy.
set -u

fail=0

# Same flags CI uses, so a local pass and a CI pass mean the same thing.
cargo clippy --quiet --lib --bins --examples "$@" || fail=1

# Run even when clippy failed: reporting both problems in one pass beats fixing one, re-running,
# and only then discovering the other.
cargo fmt --check || {
    fail=1
    echo "formatting check failed — run 'ws fmt kanidm' to fix" >&2
}

exit $fail
