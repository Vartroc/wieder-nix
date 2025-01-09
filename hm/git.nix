{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Andreas";
    userEmail = "andi@thurau.net";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
