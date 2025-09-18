# Contributing to Python to EXE Converter

Thank you for your interest in contributing! This guide will help you get started.

## ?? Quick Start

1. **Fork** the repository
2. **Clone** your fork locally
3. **Create** a new branch for your feature/fix
4. **Make** your changes
5. **Test** thoroughly
6. **Submit** a pull request

## ??? Development Setup

### Prerequisites
- Visual Studio 2022 or later
- .NET 8 SDK
- Windows 10/11
- Python 3.7+ (for testing)
- PyInstaller (for testing)

### Building the Project
```bash
git clone https://github.com/yourusername/python-to-exe-converter.git
cd python-to-exe-converter
dotnet build
```

### Running in Debug Mode
```bash
dotnet run --project PyConverter
```

## ?? Coding Guidelines

### Code Style
- Follow C# naming conventions
- Use async/await for I/O operations
- Add XML documentation for public methods
- Keep methods focused and small
- Use meaningful variable names

### Example Code Style
```csharp
/// <summary>
/// Validates the Python file path and checks if the file exists.
/// </summary>
/// <param name="filePath">Path to the Python file</param>
/// <returns>True if valid, false otherwise</returns>
private bool ValidatePythonFile(string filePath)
{
    if (string.IsNullOrWhiteSpace(filePath))
        return false;
        
    return File.Exists(filePath) && filePath.EndsWith(".py", StringComparison.OrdinalIgnoreCase);
}
```

## ?? Testing

### Manual Testing Checklist
- [ ] Test with different Python versions (3.7, 3.8, 3.9, 3.10, 3.11, 3.12+)
- [ ] Test with various PyInstaller scenarios (fresh install, existing, corrupted)
- [ ] Test drag-and-drop functionality
- [ ] Test all conversion options (single file, console hiding, debug mode, custom icon)
- [ ] Test error handling and recovery
- [ ] Test on different Windows versions

### Test Cases to Verify
1. **Simple Python Script**: Basic hello world
2. **Script with Dependencies**: Uses external packages
3. **GUI Application**: tkinter or similar
4. **Console Application**: Command-line tools
5. **Error Scenarios**: Invalid files, missing dependencies

## ?? Pull Request Process

### Before Submitting
1. **Test** your changes thoroughly
2. **Update** documentation if needed
3. **Add** tests for new features
4. **Check** that existing tests still pass
5. **Update** CHANGELOG.md

### PR Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested on Windows 10
- [ ] Tested on Windows 11
- [ ] Tested with Python 3.x
- [ ] Tested conversion scenarios

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No breaking changes (or clearly documented)
```

## ?? Bug Reports

When reporting bugs, please include:
- Detailed steps to reproduce
- Expected vs actual behavior
- Environment information (OS, Python version, etc.)
- Complete error logs
- Output from `check_python_setup.bat`

## ?? Feature Requests

For feature requests, please:
- Explain the use case clearly
- Describe the expected behavior
- Consider implementation complexity
- Check if similar features exist

## ?? Documentation

### Areas That Need Documentation
- Code comments and XML docs
- README updates for new features
- TROUBLESHOOTING.md additions
- CHANGELOG.md entries

### Documentation Style
- Clear, concise language
- Step-by-step instructions
- Include screenshots for UI changes
- Add examples where helpful

## ?? Priority Areas for Contribution

### High Priority
- Bug fixes for existing functionality
- Performance improvements
- Better error messages and diagnostics
- Cross-platform compatibility research

### Medium Priority
- UI/UX improvements
- Additional PyInstaller options
- Batch conversion features
- Integration with popular Python IDEs

### Future Ideas
- Linux/macOS support (requires UI framework change)
- Project templates and presets
- Virtual environment integration
- Advanced packaging options

## ??? Architecture Overview

### Key Components
- **Form1.cs**: Main UI and orchestration logic
- **Python Detection**: Multiple methods for finding Python installations
- **PyInstaller Management**: Installation, detection, and execution
- **Process Management**: Async process handling with proper cleanup
- **Error Handling**: Comprehensive error recovery and user guidance

### Design Principles
- **Reliability**: Multiple fallback methods for robustness
- **User Experience**: Clear feedback and intuitive interface
- **Maintainability**: Well-structured, documented code
- **Extensibility**: Easy to add new features and options

## ?? Community Guidelines

### Be Respectful
- Use inclusive language
- Be patient with newcomers
- Provide constructive feedback
- Help others learn and grow

### Communication
- Use GitHub Issues for bug reports and feature requests
- Use Discussions for questions and general conversation
- Keep conversations focused and on-topic
- Search existing issues before creating new ones

## ?? License

By contributing, you agree that your contributions will be licensed under the MIT License.

## ? Questions?

- Create an issue for bugs or feature requests
- Use GitHub Discussions for questions
- Check the TROUBLESHOOTING.md for common issues

Thank you for contributing to make Python development more accessible! ??