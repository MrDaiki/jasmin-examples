with import <nixpkgs>{};

mkShell{
    packages =  with ocamlPackages; [jasmin-compiler];
}