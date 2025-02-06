
# wieder-nix


<div align="center">

![Logo](./assets/images/logo.jpeg)

![License](https://img.shields.io/badge/License-GPLv3-blue.svg)
![Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)
</div>
Hello, I'm quite surprised you made it here. Well, this repo is just for my personal config. License is GPLv3. 

## Goals:
### Minimalstic mindset:
- only the stuff that I need
- no waybar, no fancy flexing command line tools like cmatirx, 
- just the stuff that I need: gaming, socialization (Vesktop, Signal), useful cli tools (tree, bat)
### Modularization:
- almost every feature has an easy enable option
- every enable option is found in configuration.nix
--> easily make new configurations without a hassle

## File Structure:
```tree
.
├── flake.lock
├── flake.nix  
│   --- The main entry point for the Nix flake configuration. Flakes make configurations cleaner and reusable!
├── hm  
│   --- Home-Manager-specific configurations, distinct from NixOS system-level files.
│   ├── default.nix --- Imports all files in the `hm` directory.
│   │   ...
── nix  
│   --- Contains system-wide NixOS configurations, not related to Home-Manager:
│   ├── default.nix                 --- Imports all files in this directory.  
│   ├── nixvim                      --- Nixvim configuration. Planning to switch to kickstart.nixvim for a cleaner setup.  
│   │   └── ... 
│   └──...
├── assets                          --- Directory containing non .nix files
│   ├── images                      --- Images (e.g. .png, .jpeg, .pdf)
│   │   ├── ...
│   │   └── wallpapers              --- Collection of my wallpapers
│   │       └── ...
│   └── text                        --- Textfiles lol
│       ├── scripts                 --- universal scripts using writeShellApplication
│       │   ├── default.nix
│       │   ├── test1.nix
│       │   └── test.nix
│       └── text-emojis.txt         --- Emoji file for a "custom" emoji picker
── hosts  
│   --- Host-specific configurations, each containing:  
│   ├── configuration.nix           --- NixOS system configuration.
│   ├── hardware-configuration.nix  --- Auto-generated hardware settings for the host.
│   └── home.nix                    --- Home-Manager configuration specific to the host.  
│
└── README.md   --- You're looking at it!  

```



### Issue Tracker:
    - cross dependencies between /nix/niri.nix and /hm/niri.nix
    - config required for:
        - fuzzel
        - kitty
    - notification deamon with e.g. time shortcut
    - disko config


### Credit:
[refact0r/system24](https://github.com/refact0r/system24/tree/main) - Vesktop Theme
