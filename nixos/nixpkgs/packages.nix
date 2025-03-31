{ pkgs, lib, ... }:
{

  users.users.baptiste.packages = with pkgs; [

    vlc

    # Fonts
    nerdfonts

    # Paper
    bc
    krita
    libreoffice
    zim
    ganttproject-bin
    gimp
    vim-full

    # Ide
    vscode-fhs
    kdePackages.kate
    jetbrains-toolbox

    # Stat
    mission-center
    gpustat
    htop
    kdePackages.filelight

    # tools
    git
    gh
    unzip
    sl
    ncdu
    usbutils
    rustdesk

    # ACDC
    dotnet-sdk_7

    # nix
    devenv

    # build systems
    criterion
    autoconf
    autoconf-archive
    automake
    cmake
    gnumake
    meson
    ninja

    # compilers
    # Putting gcc before clang means that `which cc` will be `gcc` instead of
    # `clang`
    gcc
    # gcc-unwrapped with lower priority than gcc so `gcov` is available and
    # `gcc` is still wrapped
    (lib.setPrio (gcc.meta.priority + 1) gcc-unwrapped)

    clang_12
    llvmPackages_12.llvm
    llvmPackages_12.lld

    # testing frameworks

    gtest
    gcovr
    python311Full
    python311Packages.pytest

    # misc
    bintools
    capstone
    check
    checkbashisms
    clang-tools
    ctags
    dash
    doxygen
    fakeroot
    flex
    gdb
    lcov
    ltrace
    pkg-config
    readline
    rr
    shellcheck
    strace
    tk
    valgrind
    bear

    # Tiger
    boost
    re-flex
    bison
    libxslt
    libtool
    perl
    swig4
    clang_multi
    libllvm
    multiStdenv.cc

    # lcov dependencies
    perlPackages.JSON
    perlPackages.PerlIOgzip

    # vcs
    git
    pre-commit
    subversion
    tig

    # EPITA Net.
    gns3-gui
    gns3-server
    inetutils
    pkgsi686Linux.dynamips
    tigervnc
    vpcs
    aria2

    xdot
    nixfmt-rfc-style

  ];

  virtualisation.virtualbox.host.enable = true;

  environment.variables = {
    ACLOCAL_PATH = "${pkgs.autoconf-archive}/share/aclocal:${pkgs.autoconf}/share/aclocal:${pkgs.automake}/share/aclocal";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-7.0.410"
  ];

}
