{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      symbol_map =
        let
          mappings = [
            "U+23FB-U+23FE"
            "U+2B58"
            "U+E200-U+E2A9"
            "U+E0A0-U+E0A3"
            "U+E0B0-U+E0BF"
            "U+E0C0-U+E0C8"
            "U+E0CC-U+E0CF"
            "U+E0D0-U+E0D2"
            "U+E0D4"
            "U+E700-U+E7C5"
            "U+F000-U+F2E0"
            "U+2665"
            "U+26A1"
            "U+F400-U+F4A8"
            "U+F67C"
            "U+E000-U+E00A"
            "U+F300-U+F313"
            "U+E5FA-U+E62B"
          ];
        in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # set some aliases, feel free to add more or remove some
    shellAliases = {
      nrsb = "sudo nixos-rebuild switch --flake .#baptiste";
      fetch = "fastfetch | dotacat";
      ls = "ls -A --color=auto";
      grep = "grep --color -n";
      gf = "git fetch";
      gs = "git status && pre-commit";
      nx = "nix run nixpkgs#nixVersions.nix_2_25 develop";
      "«" = "cd ../";
      "•" = "ls -A --color=auto";
      mktmp = "cd $(mktemp -d)";
    };

    bashrcExtra = builtins.readFile ./bashrcExtra.sh;
  };

  programs.starship = {
    enable = true;
    # Configuration écrite dans ~/.config/starship.toml
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      # package.disabled = true;
      sudo = {
        disabled = false;
        symbol = "👑 ";
        style = "red";
        format = "[Master $symbol]($style)";
      };
      status = {
        disabled = false;
        pipestatus = false;
        symbol = "";
      };
      git_metrics = {
        disabled = false;
      };
      c = {
        format = "via [$symbol]($style)";
      };
    };
  };
}
