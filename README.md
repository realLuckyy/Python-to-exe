# PyConverter - Python to EXE Converter

[![Build Status](https://github.com/realLuckyy/Python-to-exe/workflows/Build%20and%20Release/badge.svg)](https://github.com/realLuckyy/Python-to-exe/actions)
[![Release](https://img.shields.io/github/v/release/realLuckyy/Python-to-exe)](https://github.com/realLuckyy/Python-to-exe/releases)
[![Downloads](https://img.shields.io/github/downloads/realLuckyy/Python-to-exe/total)](https://github.com/realLuckyy/Python-to-exe/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **A powerful Windows GUI application for converting Python scripts to standalone executables using PyInstaller integration.**

Transform your Python projects into professional Windows applications with zero dependencies required on the target machine!

## Features

### Core Functionality
- **One-Click Conversion** - Convert Python scripts to EXE files with a single button click
- **Smart PyInstaller Integration** - Automatically handles PyInstaller execution and arguments
- **Automatic Python Detection** - Finds Python installations using multiple methods
- **Dependency Bundling** - Automatically detects and includes required Python modules
- **Single File Output** - Creates standalone .exe files that work on any Windows computer

### User Interface
- **Drag & Drop Support** - Simply drag Python files directly into the application
- **File Browser Integration** - Built-in file browsers for Python files, output directories, and icons
- **Real-time Output Log** - Live conversion progress with detailed status updates
- **Professional GUI** - Modern, clean interface with intuitive controls
- **Progress Indication** - Visual progress bar and status updates during conversion

### Advanced Options
- **Single File Mode** - Create one portable .exe file (`--onefile`)
- **Console Hiding** - Hide console window for GUI applications (`--noconsole`)
- **Debug Mode** - Enable detailed debugging output (`--debug all`)
- **Custom Icons** - Add custom .ico files to your executables
- **Output Directory Control** - Choose where your .exe files are created
- **Clean Builds** - Automatic cleanup of temporary build files

### Production Ready
- **Settings Persistence** - Remembers your last used directories and settings
- **Comprehensive Logging** - Detailed log files with timestamps and error tracking
- **Input Validation** - Prevents errors with thorough file and path validation
- **Error Recovery** - Graceful handling of missing files and failed operations
- **Process Management** - Safe handling of PyInstaller processes and cleanup

## Quick Start

### Prerequisites
- Windows 10/11
- Python 3.7+ (automatically detected)
- PyInstaller (automatically installed if missing)

### Installation

#### Option 1: Download Standalone Executable (Recommended)
1. Go to [Releases](https://github.com/realLuckyy/Python-to-exe/releases)
2. Download `PyConverter.exe`
3. Run directly - no installation required!

#### Option 2: Build from Source
```bash
git clone https://github.com/realLuckyy/Python-to-exe.git
cd Python-to-exe
dotnet build -c Release
```

### Usage

1. **Launch PyConverter.exe**
2. **Select your Python file** (drag & drop or browse)
3. **Choose output directory** (defaults to Desktop)
4. **Configure options** (single file, console hiding, custom icon)
5. **Click Convert** - watch the magic happen!

## Building from Source

### Prerequisites
- Visual Studio 2022 or VS Code
- .NET 8.0 SDK
- Windows 10 SDK

### Build Steps
```bash
# Clone the repository
git clone https://github.com/realLuckyy/Python-to-exe.git
cd Python-to-exe

# Build debug version
dotnet build

# Build release version
dotnet build -c Release

# Create standalone executable
dotnet publish -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true
```

### Build Scripts
We provide convenient build scripts:

- **`build-standalone.bat`** - Creates self-contained executable
- **`build-all-platforms.bat`** - Builds for both x64 and x86
- **`build-release.bat`** - Full release build with all configurations

## System Requirements

### Runtime Requirements
| Component | Minimum | Recommended |
|-----------|---------|-------------|
| OS | Windows 10 | Windows 11 |
| RAM | 512 MB | 2 GB |
| Storage | 100 MB | 500 MB |
| .NET | None (standalone) | N/A |

### Development Requirements
| Component | Version |
|-----------|---------|
| .NET SDK | 8.0+ |
| Visual Studio | 2022+ |
| Python | 3.7+ |

## Troubleshooting

### Common Issues

**"PyInstaller not found"**
- Install PyInstaller: `pip install pyinstaller`
- Or let PyConverter install it automatically

**"Python not detected"**
- Install Python from [python.org](https://python.org)
- Ensure Python is in your PATH
- Use the portable Python option in PyConverter

**"Conversion failed"**
- Check the output log for detailed error messages
- Ensure your Python script runs without errors
- Verify all dependencies are installed

### Getting Help
- Check our [Documentation](docs/)
- [Report Issues](https://github.com/realLuckyy/Python-to-exe/issues)
- [Discussions](https://github.com/realLuckyy/Python-to-exe/discussions)

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup
1. Fork the repository
2. Clone your fork
3. Create a feature branch
4. Make your changes
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [PyInstaller](https://pyinstaller.readthedocs.io/) - The powerful Python packaging tool
- [.NET](https://dotnet.microsoft.com/) - Cross-platform development framework
- [Windows Forms](https://docs.microsoft.com/dotnet/desktop/winforms/) - GUI framework

## Project Stats

![GitHub stars](https://img.shields.io/github/stars/realLuckyy/Python-to-exe?style=social)
![GitHub forks](https://img.shields.io/github/forks/realLuckyy/Python-to-exe?style=social)
![GitHub issues](https://img.shields.io/github/issues/realLuckyy/Python-to-exe)
![GitHub pull requests](https://img.shields.io/github/issues-pr/realLuckyy/Python-to-exe)

## Support the Project

If you find PyConverter useful, consider supporting the development:

[![Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/root)

---

**Made with ?? by [Luckyy](https://github.com/realLuckyy)**

> Transform Python scripts into professional Windows applications - no dependencies required!