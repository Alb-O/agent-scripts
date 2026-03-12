## committer

No git add/commit workflow (git add -N for nix evals ok)
Always use committer, helper on path atomically stages+commits only listed
Usage (confident): committer <repo-path> $'commit message' <file-or-glob> [more files/globs...]
Deleted pathspec valid (renames: specify both paths to detect)
One string msg (ANSI-C quoting), conventional, header+detailed body
```bash
command -v committer; git diff --shortstat -U1
committer . $'feat(domain): add selected files\n\n- include docs\n- include test fixture' test.txt "weird name.txt" "dir/*.md"
```
