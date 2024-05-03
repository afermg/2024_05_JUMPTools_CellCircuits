{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  tl = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      # scheme-medium
      scheme-full
      minted
    ;
  });
  pythonEnv = pkgs.python3.withPackages (ps: [
    ps.pygments
  ]);

in
mkShell {
  buildInputs = with pkgs.buildPackages; [
      git
      gnutar
      pythonEnv
      tl
      # texliveFull
	    emacs29
  ];
}
