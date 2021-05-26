self: super: {
  clang-format-diff = super.callPackage ../packages/clang-format-diff.nix {} ;
  vowpal-wabbit = super.callPackage ../packages/vowpal-wabbit {} ;
  cpprestsdk = super.callPackage ../packages/cpprestsdk {} ;
}