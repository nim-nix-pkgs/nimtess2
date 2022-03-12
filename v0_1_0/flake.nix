{
  description = ''Nim wrapper for libtess2'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimtess2-v0_1_0.flake = false;
  inputs.src-nimtess2-v0_1_0.owner = "genotrance";
  inputs.src-nimtess2-v0_1_0.ref   = "refs/tags/v0.1.0";
  inputs.src-nimtess2-v0_1_0.repo  = "nimtess2";
  inputs.src-nimtess2-v0_1_0.type  = "github";
  
  inputs."nimgen".dir   = "nimpkgs/n/nimgen";
  inputs."nimgen".owner = "riinr";
  inputs."nimgen".ref   = "flake-pinning";
  inputs."nimgen".repo  = "flake-nimble";
  inputs."nimgen".type  = "github";
  inputs."nimgen".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimgen".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimtess2-v0_1_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimtess2-v0_1_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}