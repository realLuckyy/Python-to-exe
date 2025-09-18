# Git Cleanup Commands

# Remove unnecessary files
rm -f setup-github-repo.bat create-github-repo.bat repo-check.bat setup-git-auth.bat
rm -f final-setup.bat cleanup-repo.bat repository-status.bat final-cleanup.bat  
rm -f CLEANUP_GUIDE.md RELEASE_STATUS.md REPOSITORY_STRUCTURE.md

# Add all remaining files
git add .

# Commit with clean message
git commit -m "PyConverter v1.0: Clean production-ready repository"

# Push to GitHub
git push origin main

echo "Repository cleaned and pushed to GitHub!"
echo "View at: https://github.com/realLuckyy/Python-to-exe"