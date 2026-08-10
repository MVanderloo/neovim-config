return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = [[
          let
            flake = builtins.getFlake (toString ./.);
          in
            flake.inputs.nixpkgs.legacyPackages.${builtins.currentSystem}
        ]],
      },

      options = {
        ["home-manager"] = {
          expr = '(builtins.getFlake (toString ./.)).homeConfigurations.mi30175.options',
        },
      },
    },
  },
}
