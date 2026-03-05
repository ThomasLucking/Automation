git remote -v https://github.com/you/project.git

# Add Gitea as a second remote
git remote add gitea https://your-gitea-server.com/you/project.git

# Now push to both
git push origin main   # → GitHub
git push gitea main    # → Gitea
