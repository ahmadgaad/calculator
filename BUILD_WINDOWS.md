# Building Windows Executable

## Important Note
- **APK files** are for Android devices, not Windows
- For Windows, you need to build a **Windows executable (.exe)** file
- Windows builds can only be created on a Windows machine

## Prerequisites for Windows Build

1. **Windows 10/11** machine
2. **Visual Studio 2022** with:
   - Desktop development with C++
   - Windows 10/11 SDK
3. **Flutter SDK** installed
4. **Git** installed

## Build Steps on Windows

1. **Open Command Prompt or PowerShell** on your Windows machine

2. **Navigate to the project directory:**
   ```bash
   cd path\to\calculator
   ```

3. **Get Flutter dependencies:**
   ```bash
   flutter pub get
   ```

4. **Build the Windows executable:**
   ```bash
   flutter build windows --release
   ```

5. **Find the executable:**
   The built executable will be located at:
   ```
   build\windows\x64\runner\Release\calculator.exe
   ```

## Distribution

The entire `build\windows\x64\runner\Release\` folder contains all necessary files to run the calculator. You can:
- Copy the entire folder to distribute the app
- Create a ZIP file of the folder for easy distribution
- Use an installer tool (like Inno Setup or NSIS) to create a proper installer

## Alternative: Build on macOS for Windows

If you want to build for Windows from macOS, you can:
1. Use a Windows virtual machine
2. Use GitHub Actions or other CI/CD services
3. Use a Windows cloud instance

## Current Project Status

✅ Windows platform support is configured
✅ Window size set to 400x600 pixels
✅ Window is non-resizable
✅ Calculator functionality complete

The project is ready to build on a Windows machine!

