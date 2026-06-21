Set-Location C:\Users\aswin\.gemini\antigravity-ide\scratch\spoon_knife_experiment

# 1. Sync main branch
git checkout main
git pull origin main

# 2. Create feature branch from the current main
git checkout -b feature-conflict

# 3. Modify line 16 in feature-conflict
$content = Get-Content index.html
$content[15] = "  Fork me? Fork you, @octocat! (Modified in feature branch)"
$content | Set-Content index.html
git commit -am "feat: update index.html in feature branch"

# 4. Switch back to main branch
git checkout main

# 5. Modify line 16 in main branch
$content = Get-Content index.html
$content[15] = "  Fork me? Fork you, @octocat! (Modified in main branch)"
$content | Set-Content index.html
git commit -am "chore: update index.html in main branch"
git push origin main

# 6. Switch back to feature branch
git checkout feature-conflict

# 7. Merge main into feature-conflict (this will trigger conflict)
git merge main
