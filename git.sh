ginit() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: ginit \"commit message\" <remote-url>"
    echo "Example: ginit \"initial commit\" https://github.com/enXov/git.git"
    return 1
  fi

  git init
  git add .
  git commit -m "$1"
  git remote add origin "$2"
  git branch -M main
  git push -u origin main
}

add() {
  git add .
}

commit() {
  git commit -m "$1"
}

push() {
  git push
}

nuke() {
  git reset --hard origin/$(git rev-parse --abbrev-ref HEAD) && git clean -fd
}

acp() {
  git add .
  git commit -m "$1"
  git push
}

acp_fraud() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: acp_fraud \"commit message\" <github-username>"
    return 1
  fi

  local msg="$1"
  local username="$2"
  local name=""
  local email=""

  local repos
  repos=$(curl -s "https://api.github.com/users/$username/repos?type=owner&sort=pushed&per_page=10" \
    | tr -d '\000-\037' \
    | jq -r '[.[] | select(.fork == false)] | .[].full_name')

  if [ -z "$repos" ]; then
    echo "❌ No owned repositories found for '$username'."
    return 1
  fi

  while IFS= read -r repo; do
    local commit_data
    commit_data=$(curl -s "https://api.github.com/repos/$repo/commits?author=$username&per_page=1" \
      | tr -d '\000-\037')
    name=$(printf '%s\n' "$commit_data" | jq -r '.[0].commit.author.name // empty' 2>/dev/null)
    email=$(printf '%s\n' "$commit_data" | jq -r '.[0].commit.author.email // empty' 2>/dev/null)

    if [ -n "$name" ] && [ -n "$email" ]; then
      break
    fi
    name=""
    email=""
  done <<< "$repos"

  if [ -z "$name" ] || [ -z "$email" ]; then
    echo "❌ Could not find any authored commits for '$username'."
    return 1
  fi

  echo "🎭 Committing as: $name <$email>"

  git add .
  GIT_AUTHOR_NAME="$name" \
  GIT_AUTHOR_EMAIL="$email" \
  GIT_COMMITTER_NAME="$name" \
  GIT_COMMITTER_EMAIL="$email" \
  git commit -m "$msg"
  git push
}
