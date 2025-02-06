{
  pkgs,
  ...
}:
{
  users.users.andi = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
    ]; # Enable ‘sudo’ for the user.
    initialPassword = "password";
    shell = pkgs.fish;
  };
}
