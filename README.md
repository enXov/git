# git

Shell functions that make Git easier

## 📦 All Functions

| Function | Description |
|----------|-------------|
| `add` | Stage all changes |
| `commit "msg"` | Commit with message |
| `push` | Push to remote |
| `acp "msg"` | Add → Commit → Push |
| `acp-fraud "msg" user` | **Add → Commit → Push** as any GitHub user |
| `nuke` | Hard reset to remote & clean untracked |

## 📥 Setup

```bash
cat git.sh >> ~/.yourterminalrcfile
source ~/.yourterminalrcfile
```