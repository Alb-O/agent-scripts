{ pkgs, lib, ... }:

let
  committer = pkgs.writeShellApplication {
    name = "committer";
    runtimeInputs = [
      pkgs.git
      pkgs.gnugrep
      pkgs.prek
    ];
    text = builtins.readFile ./committer.sh;
  };
in
{
  options.instructions.instructions = lib.mkOption {
    type = with lib.types; listOf str;
    default = [];
    description = "Shared instruction text that modules can add.";
  };

  config = {
    instructions.instructions = lib.mkBefore [ (builtins.readFile ./AGENTS.md) ];

    packages = [ committer ];

    outputs.committer = committer;
  };
}
