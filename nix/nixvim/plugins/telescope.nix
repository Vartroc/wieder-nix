{ ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
    };
    plugins.web-devicons = {
      enable = true;
    };
  };
}
