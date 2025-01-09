{ lib, config, ... }:
{
options = {
	custom.andi.enable = lib.mkEnableOption "the andi user";
};
config = lib.mkIf config.custom.andi.enable {
	users.users.andi = {
  		isNormalUser = true;
  		extraGroups = [ "wheel" "input" ]; # Enable ‘sudo’ for the user.
		initialPassword = "password";	
  	};
};
}
