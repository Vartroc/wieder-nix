{ config, ... }:
{
programs.nixvim = {
    opts = {
	number = true;
	shiftwidth = 2;
	relativenumber = true;
	termguicolors = true;
    };
    
    clipboard = {
	register = "unnamedplus";
	providers.wl-copy.enable = true;
    };
    globals.mapleader = " ";
};
}
