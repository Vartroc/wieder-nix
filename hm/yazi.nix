{ pkgs, ... }:
{
home.packages = with pkgs; [
  yazi
];

xdg.mimeApps = {
  enable = true;
  defaultApplications = {
    "inode/directory" = "yazi.desktop";
  };
};

home.file.".local/share/applications/yazi.desktop".text = ''
    [Desktop Entry]
    Name=Yazi
    Exec=kitty -e yazi
    Type=Application
    MimeType=inode/directory;
  '';


}
