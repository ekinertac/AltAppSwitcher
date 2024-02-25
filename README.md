This program brings MacOS-like app switching on Windows. Use alt + tab to select active app and alt + ~ to switch between windows of the active app.

## Using MacAppSwitcher:
Get the executable (Win64 only) from the repo release page https://github.com/hdlx/MacAppSwitcher/releases/.

**Run the executable with admin privilege.**

You can kill it from the task manager. Search for "MacAppSwitcher".

## Known issues
- Missing instructions to have MacAppSwitcher launching on system startup. We can't trivially add a shortcut the startup folder because of admin privilege requirement.
- Some window seems to interfere with keyboard inputs messages, thus disabling MacAppSwitcher when in focus.

## Development
This is a C project relying only on Windows C API. I'm using GCC (mingw) and vscode.
