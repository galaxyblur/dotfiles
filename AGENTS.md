# Dotfiles: Agent Guide

Personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/). This directory is chezmoi's source state; the files it manages live in `~`. `CLAUDE.md` is a symlink to this file.

Agents acting for a person: read ASSISTANTS.md.

## How chezmoi maps files

- Source names carry attributes: `dot_zshrc` → `~/.zshrc`, `private_` sets mode 600/700, `executable_` sets +x, `modify_` scripts rewrite a target in place, and `.keep` holds a directory without installing anything.
- `.chezmoiexternal.toml` pulls pinned files from elsewhere, e.g. `assistants-visit` from the ASSISTANTS.md spec. Pin by commit, not tag.
- `.chezmoiignore` lists source files that never install. Every repo-root doc (`AGENTS.md`, `ASSISTANTS.md`, `CLAUDE.md`, `board/`) is there. Add any new root doc to it, or it lands in `~`.

## Working rules

- Edit the source, check `chezmoi diff <target>`, then `chezmoi apply <target>`. Always name the target. A bare `chezmoi apply` overwrites any local drift on every managed file.
- When the machine's copy is the correct one, read `chezmoi diff --reverse <target>`, then `chezmoi re-add <target>`.
- `~/.claude/settings.json` stays unmanaged except through `dot_claude/modify_private_settings.json`, which only ensures the session hook. Machines differ; don't take the file over.
- Machine-local config goes in unmanaged files, e.g. `~/.config/assistants/homes`.
- **This repo is public.** No secrets, tokens, hostnames, IPs, or client names. Anything sensitive goes in an unmanaged local file that the managed file sources.
- Personal machines only. The work machine keeps its own fork.
- Commit subjects are short and imperative, matching the existing history.
