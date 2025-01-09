{ config, lib, pkgs, ... }:
{
options.custom.zfs.enable = lib.mkEnableOption "support for zfs.";

config = lib.mkIf config.custom.zfs.enable {
		boot = {
		  loader.grub = {
			zfsSupport = true;
			mirroredBoots = [
				{ devices = [ "nodev" ]; path = "/boot"; }
			];
		};

kernelPackages = pkgs.linuxPackages_xanmod_latest;
        # lock xanmod version
        # kernelPackages =
        #   assert lib.assertMsg (lib.versionOlder pkgs.zfs_unstable.version "2.3")
        #     "zfs 2.3 supports kernel 6.11 or greater";
        #   pkgs.linuxPackagesFor (
        #     pkgs.linux_xanmod_latest.override {
        #       argsOverride = rec {
        #         version = "6.10.11";
        #         modDirVersion = lib.versions.pad 3 "${version}-xanmod1";
        #         src = pkgs.fetchFromGitHub {
        #           owner = "xanmod";
        #           repo = "linux";
        #           rev = modDirVersion;
        #           hash = "sha256-FDWFpiN0VvzdXcS3nZHm1HFgASazNX5+pL/8UJ3hkI8=";
        #         };
	

	    };

	networking.hostId = "afcefed7";
	};
}
