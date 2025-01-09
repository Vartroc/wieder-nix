{ ... }:
{
programs.nixvim.plugins.lsp = {
  enable = true;
  servers = {
    texlab.enable = true;
    nil_ls.enable = true;
  };
};
}
