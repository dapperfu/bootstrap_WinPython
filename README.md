# Bootstrap [WinPython](https://winpython.github.io/)

Bootstrap a [WinPython](https://winpython.github.io/) environment for the current project.

Goal: "Deterministic"ish Windows Builds/Environment.

# Acquisition

1. ```git clone https://github.com/jed-frey/bootstrap_WinPython.git```
1. ```git submodule add https://github.com/jed-frey/bootstrap_WinPython.git```
1. [Download .zip](https://github.com/jed-frey/bootstrap_WinPython/archive/master.zip)
    - Extract .zip.

# Installation

1. Run [```bootstrap_WinPython.bat```](bootstrap_WinPython.bat).
    - Double Click it.
    - Type "```bootstrap_WinPython.bat```" into ```cmd.exe```

# Usage.

Add:

    call %~dp0\bootstrap_WinPython\env_winpython.bat

To your ```env_[proj_name].bat``` folder.


tldr:

    git submodule add https://github.com/jed-frey/bootstrap_WinPython.git
    bootstrap_WinPython\bootstrap_WinPython.bat
    echo call %~dp0\bootstrap_WinPython\env_winpython.bat >> env_.bat