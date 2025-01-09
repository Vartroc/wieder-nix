{ pkgs, ... }:
{
programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
	telekasten-nvim
    ];
    extraConfigLua = ''
require('telekasten').setup({
  home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
  extension = ".tex",
})
    '';
};
}
