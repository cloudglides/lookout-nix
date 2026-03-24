# lookout-nix

Nix flake packaging for [Lookout](https://github.com/hackclub/lookout) by Hack Club.

## Install

Add to your flake inputs:

```nix
lookout-nix = {
  url = "github:cloudglides/lookout-nix";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Then add to your packages:

```nix
environment.systemPackages = [ inputs.lookout-nix.packages.${system}.default ];
```

Or install ad-hoc:

```bash
nix profile install github:cloudglides/lookout-nix
```

## Run without installing

```bash
nix run github:cloudglides/lookout-nix
```

## Notes

- Packaged from the official `.deb` release
- Tested on NixOS with GNOME on Wayland
- If Lookout won't launch, make sure `xdg-desktop-portal-gnome` is enabled
