{ pkgs }:
pkgs.writeShellApplication {
  name = "notify-time";
  runtimeInputs = [
    pkgs.libnotify
  ];
  text = ''
    time=$(($(date +%H) % 12))

    case $time in
      1)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-one.png
        ;;
      2)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-two.png
        ;;
      3)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-three.png
        ;;
      4)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-four.png
        ;;
      5)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-five.png
        ;;
      6)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-six.png
        ;;
      7)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-seven.png
        ;;
      8)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-eight.png
        ;;
      9)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-nine.png
        ;;
      10)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-ten.png
        ;;
      11)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-eleven.png
        ;;
      0)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-twelve.png
        ;;

      *)
        notify-send "$(date)" "Time" -u normal -i ~/wieder-nix/assets/images/clock/clock-one.png
        ;;
    esac
  '';
}
