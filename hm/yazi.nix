{ lib, config, ... }:
{
options.custom.yazi.enable = lib.mkEnableOption "custom config for yazi file manager";
  config = lib.mkIf config.custom.yazi.enable {

programs.yazi = {
  enable = true;
};

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

};
}
