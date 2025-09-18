# Developer Guide: Bundled PyInstaller

This guide explains how PyInstaller is bundled with PyConverter to provide offline functionality.

## Overview

PyConverter now includes a complete PyInstaller distribution, allowing users to convert Python files to EXE without requiring an internet connection. This includes:

- PyInstaller 6.16.0 and all dependencies as wheel files
- A complete virtual environment with PyInstaller installed
- Automatic fallback to online installation if bundled files are missing

## Bundle Structure

```
bundled/
├── wheels/                          # Wheel files for offline installation
│   ├── pyinstaller-6.16.0-py3-none-win_amd64.whl
│   ├── altgraph-0.17.4-py2.py3-none-any.whl
│   ├── packaging-25.0-py3-none-any.whl
│   ├── pefile-2023.2.7-py3-none-any.whl
│   ├── pyinstaller_hooks_contrib-2025.8-py3-none-any.whl
│   ├── pywin32_ctypes-0.2.3-py3-none-any.whl
│   ├── setuptools-80.9.0-py3-none-any.whl
│   ├── wheel-0.45.1-py3-none-any.whl
│   └── pip-25.2-py3-none-any.whl
├── pyinstaller/                     # Virtual environment with PyInstaller
│   ├── Scripts/
│   │   ├── pyinstaller.exe         # Main PyInstaller executable
│   │   ├── python.exe              # Python interpreter
│   │   └── pip.exe                 # Package installer
│   ├── Lib/                        # Python libraries
│   └── Include/                     # Header files
└── bundle-info.txt                 # Information about the bundle
```

## How It Works

The PyConverter application uses the following logic:

1. **First Priority**: Check for bundled PyInstaller executable at `bundled/pyinstaller/Scripts/pyinstaller.exe`
2. **Second Priority**: Install from bundled wheels using `bundled/wheels/` directory
3. **Fallback**: Download and install PyInstaller from the internet

The relevant code is in `Form1.cs`:
- `TryExtractBundledPyInstaller()` - Checks for bundled executable
- `InstallBundledPyInstaller()` - Installs from bundled wheels
- Regular PyInstaller installation methods as fallback

## Building the Bundle

### Initial Setup (for developers)

To create the bundled PyInstaller files:

```batch
# Run the bundling script
bundle-pyinstaller.bat
```

This will:
1. Download PyInstaller and all dependencies as wheel files
2. Create a virtual environment in `bundled/pyinstaller/`
3. Install PyInstaller in the virtual environment
4. Generate a bundle information file

### Including in Releases

The `build-release.bat` script automatically includes bundled files:

```batch
# Copy bundled PyInstaller (if it exists)
if exist "bundled" (
    echo Copying bundled PyInstaller...
    xcopy "bundled" "Release\win-x64\bundled\" /E /I /H /Y
)
```

## Maintenance

### Updating PyInstaller Version

To update the bundled PyInstaller:

1. Delete the existing `bundled` directory
2. Run `bundle-pyinstaller.bat` to create a new bundle with the latest version
3. Test the bundle with the application
4. Commit the updated bundle files

### Bundle Size Considerations

The current bundle is approximately 50-70 MB, including:
- PyInstaller virtual environment: ~40-50 MB
- Wheel files: ~10-20 MB

To minimize size:
- Only essential dependencies are included
- Wheel files are binary distributions (faster, smaller than source)
- No documentation or test files are included

### Verification

To verify the bundle works correctly:

1. Delete any system-installed PyInstaller
2. Disconnect from the internet
3. Run PyConverter and convert a simple Python script
4. Verify it works without network access

## Benefits for Users

- **No Internet Required**: Works completely offline
- **Faster Setup**: No download time during first use
- **Consistent Version**: Same PyInstaller version for all users
- **Reliable**: Avoids network-related installation failures
- **Self-Contained**: Entire application is portable

## Technical Notes

- The bundled PyInstaller uses a separate virtual environment to avoid conflicts
- All wheel files are included for complete offline functionality
- The application gracefully falls back to online installation if bundled files are corrupted or missing
- Bundle files are platform-specific (currently Windows x64)

## File Exclusions

The following are **NOT** included in the repository to keep it lightweight:
- `bundled/` directory (generated during build)
- Virtual environment files (recreated each time)

Developers should run `bundle-pyinstaller.bat` after cloning the repository.