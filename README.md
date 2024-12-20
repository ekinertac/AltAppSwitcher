## AltAppSwitcher: alternative application switcher for Windows

This program brings MacOS-like or Gnome-like application switching to Windows. Use `alt + tab` to select the active app (not window) and `alt + ~` to switch between windows of the active app. Key bindings are customizable.

**Tested on Windows 10 and Windows 11.**

![](./Assets/ScreenshotWin11.png)

## Launching AltAppSwitcher:
Get the archive from the [release page](https://github.com/hdlx/AltAppSwitcher/releases/).

**x86_64** and **ARM64** (AArch64) architectures are available. Please note that I was not able to test the ARM64 one myself.

**Run the `AltAppSwitcher.exe` (preferably as an administator).**

Close the application using `CloseAltAppSwitcher.bat` file.

## Run at startup:
Run `AddToStartup.bat` to add AltAppSwitcher to Windows startup apps.

Run `RemoveFromStartup.bat` to revert this.

## Customization
**"Settings"** executable lets you change settings such as **key bindings**, **theme**, **scale** and **mouse support**.

## Known issues
- Alt tab popup is behind start menu.
- On some releases, .exe might be flagged as malicious by Windows Defender. This is a false positive (detection relies on machine learning).

## Building from source
This is a C project relying on C standard library and Windows API. I'm using [Clang (mingw)](https://github.com/mstorsjo/llvm-mingw) and VS Code / VS Codium.
Here is my setup:
### Dependencies:
- **Python:**\
Download **Python** and install or add to "Path" so `python` can be called from a terminal.
- **Clang and Windows libraries:**\
Download **Clang mingw**, unzip and add to "Path" so `clang` can be called from a terminal.\
I'm using `llvm-mingw-20240619-msvcrt-x86_64` from [Clang (mingw)](https://github.com/mstorsjo/llvm-mingw) at the time of writing.
- *(Optional) mt.exe:*\
To run the deploy script, we need Microsoft's `mt.exe`. This tool is used to embed manifest in exe. The application runs fine with external manifest (when building without calling the deploy script). `mt.exe` is part of the Windows SDK.
### Building:
- Clone the repository.
- Open a terminal at the root of the repository.
- run `python.exe ./build.py AltAppSwitcher release x86_64`
- Binaries are found in `/Output/debug/x86_64`
### Debugging:
I'm using VSCodium/VSCode to write and debug code, with 2 extensions:
- https://open-vsx.org/extension/vadimcn/vscode-lldb for debugging
- https://open-vsx.org/extension/llvm-vs-code-extensions/vscode-clangd for language server integration (code completion, errors...)
  
With those, you should be able to build and run inside VSCode using the configurations defined in `.vscode\launch.json` (at the moment, configurations are written for x86_64 but you can easily create arm64 equivalent)

Configurations refers to tasks defined in `/.vscode/tasks.json`
