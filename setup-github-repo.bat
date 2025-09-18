# Git Setup Commands for PyConverter Repository

# Navigate to your project directory
cd "C:\Users\iluck\source\repos\PyConverter"

# Initialize Git repository (if not already done)
git init

# Add all files to Git
git add .

# Create initial commit
git commit -m "Initial commit: Python to EXE Converter v1.0"

# Add your GitHub repository as remote (replace with your actual repo URL)
git remote add origin https://github.com/YOUR_USERNAME/PyConverter.git

# Push to GitHub
git branch -M main
git push -u origin main

# Alternative: If you want to create the repo via GitHub CLI
gh repo create PyConverter --public --source=. --remote=origin --push