# git

Shell functions that make Git easier & cunning(fraud? idk)

## 📦 All Functions

| Function | Description |
|----------|-------------|
| `ginit "msg" "url"` | Initialize a new git repository with remote url |
| `add` | Stage all changes |
| `commit "msg"` | Commit with message |
| `push` | Push to remote |
| `nuke` | Hard reset to remote & clean untracked |
| `revert [n]` | Reverts the commit at `HEAD~n`; if no parameter is given, reverts the latest commit (`HEAD`). |
| `acp "msg"` | Add → Commit → Push |
| `acp_fraud "msg" "user"` | **Add → Commit → Push** as any GitHub user |

## Use cases: `acp_fraud` 

Instead of creating a alt-github acc, change git credentials, you can use that to commit as any github user. Use that to stay ananonymus. After terminal closes your git credentials back. *commiting as ghost? uuuu*

## 📥 Setup

```bash
cat git.sh >> ~/.yourterminalrcfile
source ~/.yourterminalrcfile
```
