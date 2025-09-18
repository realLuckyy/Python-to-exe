# PyInstaller Bundle Creation Script

# This script downloads and bundles PyInstaller components for offline installation

import os
import subprocess
import sys
from pathlib import Path

def create_bundle_directory():
    """Create the bundle directory structure"""
    bundle_dir = Path("bundled")
    bundle_dir.mkdir(exist_ok=True)
    
    wheels_dir = bundle_dir / "wheels"
    wheels_dir.mkdir(exist_ok=True)
    
    return wheels_dir

def download_pyinstaller_wheels(wheels_dir):
    """Download PyInstaller and its dependencies as wheel files"""
    packages = [
        "pyinstaller",
        "altgraph", 
        "packaging",
        "pefile",
        "pyinstaller-hooks-contrib",
        "pywin32-ctypes",
        "setuptools"
    ]
    
    for package in packages:
        print(f"Downloading {package}...")
        subprocess.run([
            sys.executable, "-m", "pip", "download",
            "--dest", str(wheels_dir),
            "--only-binary=:all:",
            package
        ], check=True)

def create_installation_script(bundle_dir):
    """Create a script to install from bundled wheels"""
    install_script = bundle_dir / "install_pyinstaller.py"
    
    script_content = '''
import subprocess
import sys
from pathlib import Path

def install_bundled_pyinstaller():
    """Install PyInstaller from bundled wheel files"""
    wheels_dir = Path(__file__).parent / "wheels"
    
    if not wheels_dir.exists():
        return False
    
    try:
        # Install from local wheels directory
        subprocess.run([
            sys.executable, "-m", "pip", "install",
            "--find-links", str(wheels_dir),
            "--no-index",
            "pyinstaller"
        ], check=True)
        
        return True
    except subprocess.CalledProcessError:
        return False

if __name__ == "__main__":
    success = install_bundled_pyinstaller()
    sys.exit(0 if success else 1)
'''
    
    install_script.write_text(script_content)

def main():
    print("Creating PyInstaller bundle...")
    
    try:
        wheels_dir = create_bundle_directory()
        download_pyinstaller_wheels(wheels_dir)
        create_installation_script(wheels_dir.parent)
        
        print(f"? Bundle created successfully at: {wheels_dir.parent}")
        print("Copy the 'bundled' directory to your application's output folder")
        
    except Exception as e:
        print(f"? Error creating bundle: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()