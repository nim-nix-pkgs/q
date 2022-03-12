{
  description = ''Simple package for query HTML/XML elements using a CSS3 or jQuery-like selector syntax'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-q-0_0_6.flake = false;
  inputs.src-q-0_0_6.owner = "OpenSystemsLab";
  inputs.src-q-0_0_6.ref   = "refs/tags/0.0.6";
  inputs.src-q-0_0_6.repo  = "q.nim";
  inputs.src-q-0_0_6.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-q-0_0_6"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-q-0_0_6";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}