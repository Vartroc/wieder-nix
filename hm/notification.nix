{ config, lib, ... }:
{
  options.custom.notification.enable = lib.mkEnableOption "fish";
  config = lib.mkIf config.custom.notification.enable {
    services.swaync = {
      enable = true;

      settings = {
        positionX = "right";
        positionY = "top";
        control-center-margin-top = 10;
        control-center-margin-bottom = 0;
        control-center-margin-right = 10;
        control-center-margin-left = 0;
        control-center-width = 500;
        control-center-height = 600;
        fit-to-screen = true;

        layer = "top";
        cssPriority = "user";
        notification-icon-size = 64;
        notification-body-image-height = 100;
        notification-body-image-width = 200;
        timeout = 10;
        timeout-low = 5;
        timeout-critical = 60;
        notification-window-width = 400;
        keyboard-shortcuts = true;
        image-visibility = "when-available";
        transition-time = 100;
        hide-on-clear = false;
        hide-on-action = true;
        script-fail-notify = true;

        widgets = [
          "title"
          "dnd"
          "mpris"
          "notifications"
        ];

        widget-config = {
          title = {
            text = "--- Notifications ---";
            clear-all-button = true;
            button-text = "Clear All";
          };

          dnd = {
            text = "--- Do Not Disturb ---";
          };

          label = {
            max-lines = 5;
            text = "Label Text";
          };

          mpris = {
            image-size = 96;
            image-radius = 12;
          };
        };
      };
    };
  };
}
