{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [
            vim
            nixfmt-rfc-style
            neovim
            postgresql
            starship
            autojump
            fishPlugins.fzf-fish
            fishPlugins.done
            fzf
            ripgrep
            zig
          ];

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;
          # nix.package = pkgs.nix;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          programs.fish.enable = true;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
          security.pam.enableSudoTouchIdAuth = true;

          system.defaults = {
            screencapture.location = "~/Pictures/screenshots";
          };
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."Will-Wilkinsons-Macbook" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Will-Wilkinsons-Macbook".pkgs;
    };
}
