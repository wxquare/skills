#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

errors=0

say() {
  printf '%s\n' "$1"
}

fail() {
  say "ERROR: $1"
  errors=$((errors + 1))
}

check_file() {
  local path="$1"
  [[ -f "$path" ]] || fail "missing file: ${path#$repo_root/}"
}

check_skill_dir() {
  local skill_dir="$1"
  local rel="${skill_dir#$repo_root/}"
  local skill_file="$skill_dir/SKILL.md"

  check_file "$skill_file"

  local name description
  name="$(sed -n 's/^name: //p' "$skill_file" | head -n1)"
  description="$(sed -n 's/^description: //p' "$skill_file" | head -n1)"

  [[ -n "$name" ]] || fail "$rel/SKILL.md missing frontmatter name"
  [[ -n "$description" ]] || fail "$rel/SKILL.md missing frontmatter description"
  [[ "$description" == Use\ when* ]] || fail "$rel/SKILL.md description should start with 'Use when'"

  check_file "$skill_dir/references/test-prompts.md"
  check_file "$skill_dir/references/non-goals.md"

  if [[ ! -f "$skill_dir/agents/openai.yaml" ]]; then
    fail "$rel missing agents/openai.yaml"
  else
    local display_name short_description default_prompt
    display_name="$(sed -n 's/^display_name: //p' "$skill_dir/agents/openai.yaml" | head -n1)"
    short_description="$(sed -n 's/^short_description: //p' "$skill_dir/agents/openai.yaml" | head -n1)"
    default_prompt="$(sed -n 's/^default_prompt: //p' "$skill_dir/agents/openai.yaml" | head -n1)"
    [[ -n "$display_name" ]] || fail "$rel/agents/openai.yaml missing display_name"
    [[ -n "$short_description" ]] || fail "$rel/agents/openai.yaml missing short_description"
    [[ -n "$default_prompt" ]] || fail "$rel/agents/openai.yaml missing default_prompt"
    [[ "$default_prompt" == *"\$$name"* ]] || fail "$rel/agents/openai.yaml default_prompt should reference \$$name"
  fi
}

while IFS= read -r skill_file; do
  check_skill_dir "$(dirname "$skill_file")"
done < <(find "$repo_root" -name SKILL.md | sort)

if [[ "$errors" -gt 0 ]]; then
  say
  say "Validation failed with $errors error(s)."
  exit 1
fi

say "All skill validation checks passed."
