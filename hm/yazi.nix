{ pkgs, ... }:
{
home.packages = with pkgs; [
  yazi
];

xdg.mime = {
  enable = true;
  defaultApplications = {
    "inode/directory" = "yazi.desktop";
  };
};

home.file.".local/share/applications".text = "yazi.desktop" ''
    [Desktop Entry]
    Name=Yazi
    Exec=kitty -e yazi
    Type=Application
    MimeType=inode/directory;
  '';


}
