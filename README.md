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
| `acp "msg"` | Add → Commit → Push |
| `acp_fraud "msg" "user"` | **Add → Commit → Push** as any GitHub user |

## Use cases: `acp_fraud` 

Instead of creating a alt-github acc, you can use that to commit as any github user. Use that to stay ananonymus.

## 📥 Setup

```bash
cat git.sh >> ~/.yourterminalrcfile
source ~/.yourterminalrcfile
```