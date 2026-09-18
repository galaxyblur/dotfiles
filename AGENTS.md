# Dotfiles: Agent Guide

Personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/). This directory is chezmoi's source state; the files it manages live in `~`. `CLAUDE.md` is a symlink to this file.

Agents acting for a person: read ASSISTANTS.md.

## How chezmoi maps files

- Source names carry attributes: `dot_zshrc` → `~/.zshrc`, `private_` sets mode 600/700, `executable_` sets +x, `modify_` scripts rewrite a target in place, and `.keep` holds a directory without installing anything.
- `.chezmoiexternal.toml` pulls pinned files from elsewhere, e.g. `assistants-visit` from the ASSISTANTS.md spec. Pin by commit, not tag.
- `.chezmoiignore` lists source files that never install. Every repo-root doc (`AGENTS.md`, `ASSISTANTS.md`, `CLAUDE.md`, `board/`) is there. Add any new root doc to it, or it lands in `~`.

## Tidy means

The state every session leaves behind:

- `chezmoi status` prints nothing: every managed file matches its source.
- The source repo is clean, and nothing is unpushed. Push after every commit.
- Every push is leak-checked first: read the diff for secrets, tokens, IPs, hostnames, and client or employer names. Don't turn on chezmoi's `git.autoCommit` or `git.autoPush`, because they skip the leak check and the chain trailers.

## Shared or local

Decide for every change, including drift that an installer appended:

| It is | It goes |
|---|---|
| Wanted on every personal machine, safe in public | the managed file |
| A known, stable difference between machines (OS, hostname, a path) | a chezmoi template (`.tmpl`) keyed on `.chezmoi.os` / `.chezmoi.hostname`, or `[data]` in `~/.config/chezmoi/chezmoi.toml` |
| Ad hoc on one machine, experimental, or sensitive | an unmanaged `~/.zshrc.local`, `~/.bashrc.local`, or `~/.gitconfig.local`, which the managed file sources if present |
| A secret | never in this repo, not even encrypted. Keep it in a local file or a password manager. |

When a classification is unclear, or something might be sensitive, ask before committing.

## Working rules

- Edit the source (`chezmoi edit <target>`, or the file here), check `chezmoi diff <target>`, then `chezmoi apply <target>`. Always name the target. A bare `chezmoi apply` overwrites any local drift on every managed file.
- Drift (someone edited `~` directly): read `chezmoi diff --reverse <target>`, classify it (above), then `chezmoi re-add <target>` or move the lines to the `.local` file.
- New file: `chezmoi add <target>`. Add `--template` if it will differ by machine.
- Shared files use `$HOME` or `~`, never an absolute home path.
- Installs run from `run_onchange_` scripts that embed a hash of what they install (e.g. a Brewfile), never plain `run_` scripts that repeat on every apply.
- `~/.claude/settings.json` stays unmanaged except through `dot_claude/modify_private_settings.json`, which only ensures the session hook. Machines differ; don't take the file over.
- `chezmoi doctor` diagnoses setup problems. `chezmoi verify` exits 0 when the machine is tidy.
- **This repo is public.** Personal machines only. The work machine keeps its own fork.
- Commit subjects are short and imperative, matching the existing history.
