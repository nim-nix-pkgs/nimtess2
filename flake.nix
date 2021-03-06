{
  description = ''Nim wrapper for libtess2'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."nimtess2-master".dir   = "master";
  inputs."nimtess2-master".owner = "nim-nix-pkgs";
  inputs."nimtess2-master".ref   = "master";
  inputs."nimtess2-master".repo  = "nimtess2";
  inputs."nimtess2-master".type  = "github";
  inputs."nimtess2-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimtess2-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nimtess2-v0_1_0".dir   = "v0_1_0";
  inputs."nimtess2-v0_1_0".owner = "nim-nix-pkgs";
  inputs."nimtess2-v0_1_0".ref   = "master";
  inputs."nimtess2-v0_1_0".repo  = "nimtess2";
  inputs."nimtess2-v0_1_0".type  = "github";
  inputs."nimtess2-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimtess2-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nimtess2-v0_1_1".dir   = "v0_1_1";
  inputs."nimtess2-v0_1_1".owner = "nim-nix-pkgs";
  inputs."nimtess2-v0_1_1".ref   = "master";
  inputs."nimtess2-v0_1_1".repo  = "nimtess2";
  inputs."nimtess2-v0_1_1".type  = "github";
  inputs."nimtess2-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimtess2-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}