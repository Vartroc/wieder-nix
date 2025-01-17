{ config, lib, pkgs, ... }:
{
options.custom.image.enable = lib.mkEnableOption "image handling by qimgv etc.";
  config = lib.mkIf config.custom.image.enable {
home.packages = with pkgs; [
  qimgv
];

xdg.mimeApps = {
  enable = true;
  defaultApplications = {
    "image/jpeg" = "qimgv.desktop";
    "image/png" = "qimgv.desktop";
    "image/svg+xml" = "qimgv.desktop";
    "image/pdf" = "zathura.desktop";
  };
};

home.file.".local/share/applications/qimgv.desktop".text = ''
    [Desktop Entry]
    Name=qimgv
    Exec=qimgv
    Type=Application
    MimeType=image/jpeg;
  '';
};
}
