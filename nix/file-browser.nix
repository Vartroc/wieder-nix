{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    yazi
  ];

  xdg.mime.defaultApplications = [
    {
      "inode/directory" = "yazi.desktop";
    }
  ];
}
