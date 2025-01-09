{ pkgs, inputs, config, ... }:
{
imports = [
	./plugins/default.nix
	./options.nix
	./keybinds.nix
];


programs.nixvim = {
	enable = true;
	colorschemes.catppuccin = {
		enable = true;
		settings.flavour = "mocha";
	};
};
}
