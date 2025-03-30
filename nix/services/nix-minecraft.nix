{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  modpack_1 = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Vartroc/bettermc/main/pack.toml";
    packHash = "gc8W6Bg3dXgWGhbhS8hZHNBt9U/yCN/2F+S0b+pMaxI=";
  };
  modpack_2 = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Vartroc/cobblemon/main/pack.toml";
    packHash = "t4rwiWusZcEIeFb9wljaxrhNACZ7XpLu+ozD0K3Hda4=";
  };

  modpack_julian = pkgs.fetchPackwizModpack {
    url = "https://codeberg.org/Irgendeinwer/fabric-packwiz/raw/tag/v1.3/pack.toml";
    packHash = "sha256-Hv1CsvokqrzrlHEJTNXyZj1o1dFGl0y0+NTUgqTh/ks=";
    manifestHash = "0bypfaf34bd95x4rh8hlb5ybps5m1g999kqw3bvwgfsvpxplrqs3";
  };
  mcVersion = modpack_julian.manifest.versions.minecraft;
  fabricVersion = modpack_julian.manifest.versions.fabric;
  serverVersion = lib.replaceStrings [ "." ] [ "_" ] "fabric-${mcVersion}";

in
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  environment.systemPackages = [
    pkgs.fabricServers.fabric-1_20_1
    pkgs.packwiz
    pkgs.xautoclick
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    # servers.hexagonal_planar_6 = {
    #   serverProperties = {
    #     white-list = true;
    #     difficulty = "normal";
    #     view-distance = 16;
    #   };
    #   jvmOpts = "-Xms6144M -Xmx8192M";
    #   enable = true;
    #   autoStart = true;
    #   whitelist = {
    #     Vartroc = "ce3a67ad-3a84-4bcb-a809-ad9d7330de01";
    #     kathu05 = "8c3c5600-2f7e-49f9-9590-c2d43abfe467";
    #     rreeper = "22d62250-fe23-4894-8006-0a23a0529631";
    #     # KeksdosenAlarm = "f7778498-2077-48b5-810b-d4c1042147b8";
    #     # JoMei9019 = "0fc25f7d-fa61-41ec-957f-e92f75c209c0";
    #   };
    #   package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.15.11"; };
    #   symlinks = {
    #     # "mods" = "${modpack_1}/mods";
    #     "ops.json" = pkgs.writeTextFile {
    #       name = "ops.json";
    #       text = "[ { \"uuid\": \"ce3a67ad-3a84-4bcb-a809-ad9d7330de01\", \"name\": \"Vartroc\", \"level\": 4 } ]";
    #     };
    #   };
    # };
    # servers.fce77b65c36dfa9c6508666e6b07097958657 = {
    #   serverProperties = {
    #     white-list = true;
    #     difficulty = "normal";
    #     view-distance = 16;
    #   };
    #   jvmOpts = "-Xms6144M -Xmx8192M";
    #   enable = true;
    #   autoStart = true;
    #   whitelist = {
    #     Vartroc = "ce3a67ad-3a84-4bcb-a809-ad9d7330de01";
    #     kathu05 = "8c3c5600-2f7e-49f9-9590-c2d43abfe467";
    #     rreeper = "22d62250-fe23-4894-8006-0a23a0529631";
    #     # KeksdosenAlarm = "f7778498-2077-48b5-810b-d4c1042147b8";
    #     # JoMei9019 = "0fc25f7d-fa61-41ec-957f-e92f75c209c0";
    #   };
    #   package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.15.11"; };
    #   symlinks = {
    #     "mods" = "${modpack_2}/mods";
    #     "ops.json" = pkgs.writeTextFile {
    #       name = "ops.json";
    #       text = "[ { \"uuid\": \"ce3a67ad-3a84-4bcb-a809-ad9d7330de01\", \"name\": \"Vartroc\", \"level\": 4 } ]";
    #     };
    #   };
    # };

    servers.afdfce77b65c36dfa9c6508666e6b07097958657 = {
      serverProperties = {
        white-list = true;
        difficulty = "normal";
        view-distance = 16;
      };
      jvmOpts = "-Xms6144M -Xmx8192M";
      enable = true;
      autoStart = true;
      whitelist = {
        Vartroc = "ce3a67ad-3a84-4bcb-a809-ad9d7330de01";
        kathu05 = "8c3c5600-2f7e-49f9-9590-c2d43abfe467";
        rreeper = "22d62250-fe23-4894-8006-0a23a0529631";
        # KeksdosenAlarm = "f7778498-2077-48b5-810b-d4c1042147b8";
        # JoMei9019 = "0fc25f7d-fa61-41ec-957f-e92f75c209c0";
      };
      package = pkgs.fabricServers.${serverVersion}.override { loaderVersion = fabricVersion; };
      symlinks = {
        "mods" = "${modpack_julian}/mods";
        "ops.json" = pkgs.writeTextFile {
          name = "ops.json";
          text = "[ { \"uuid\": \"ce3a67ad-3a84-4bcb-a809-ad9d7330de01\", \"name\": \"Vartroc\", \"level\": 4 } ]";
        };
      };
    };

  };
}
