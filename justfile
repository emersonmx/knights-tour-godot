set quiet

setup:
    #!/usr/bin/env bash
    set -euo pipefail

    git lfs install

    if ! command -v lefthook &> /dev/null; then
        echo "lefthook not found, installing..."
        go install github.com/evilmartians/lefthook/v2@latest
    fi
    lefthook install

run:
    godot .

editor:
    godot --editor .

format:
    uv tool run --from gdtoolkit gdformat .

lint:
    uv tool run --from gdtoolkit gdlint .
