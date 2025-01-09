{ pkgs, ... }:
{
programs.nixvim = {
    plugins.vimtex = {
	enable = true;
	texlivePackage = pkgs.texliveFull;
	settings = {
	  view_method = "zathura";
	  compiler_method = "latexmk";
	};
    };
};
environment.systemPackages = with pkgs; [
    zathura
    biber
];
}
