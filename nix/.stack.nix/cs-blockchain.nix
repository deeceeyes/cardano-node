{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { development = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "cs-blockchain"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "formal.methods@iohk.io";
      author = "IOHK Formal Methods Team";
      homepage = "https://github.com/input-output-hk/cardano-legder-specs";
      url = "";
      synopsis = "Executable specification of the Cardano blockchain";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.bimap)
          (hsPkgs.bytestring)
          (hsPkgs.containers)
          (hsPkgs.cs-ledger)
          (hsPkgs.goblins)
          (hsPkgs.hashable)
          (hsPkgs.hedgehog)
          (hsPkgs.lens)
          (hsPkgs.small-steps)
          ];
        };
      tests = {
        "chain-rules-test" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.containers)
            (hsPkgs.data-ordlist)
            (hsPkgs.hedgehog)
            (hsPkgs.lens)
            (hsPkgs.tasty)
            (hsPkgs.tasty-hedgehog)
            (hsPkgs.tasty-hunit)
            (hsPkgs.cs-blockchain)
            (hsPkgs.cs-ledger)
            (hsPkgs.small-steps)
            ];
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/input-output-hk/cardano-ledger-specs";
      rev = "bcba1d2d10004f1ce14c5c53478f656deffd4c38";
      sha256 = "0xn1x9dp52frd18jg9i4hvkgaffx3hr64ny87mvmsgg2xbq41a5v";
      });
    postUnpack = "sourceRoot+=/byron/chain/executable-spec; echo source root reset to \$sourceRoot";
    }