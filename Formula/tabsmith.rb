class Tabsmith < Formula
  desc "IDE-style autocomplete for your terminal: dropdown menu and inline ghost text"
  homepage "https://github.com/PedroLaRosa/tabsmith"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.0/tabsmith-darwin-arm64"
      sha256 "8b87a068fcee65bed2359541a03f2a39e06f5f376d49c998a17bdd9303eb48a5"
    end
    on_intel do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.0/tabsmith-darwin-x64"
      sha256 "6fbfe6f983bcea58f439e152656588b18630eb2e06f3fede065b3f254f56f81b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.0/tabsmith-linux-arm64"
      sha256 "3451b380c1c4de5efa6f35f9db08b4d1c3b22c53557781170c3f604b5b489edc"
    end
    on_intel do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.0/tabsmith-linux-x64"
      sha256 "10471eb59c30095c28dd522050e867a48446777fe97f78689aac78cdb05c950d"
    end
  end

  def install
    bin.install Dir["tabsmith-*"].first => "tabsmith"
  end

  def caveats
    text = <<~EOS
      To add the shell integration to your dotfiles (it asks first), run:
        tabsmith setup
      Homebrew updates this copy (brew upgrade tabsmith); it does not update itself.
      Before brew uninstall tabsmith, run: tabsmith uninstall
    EOS
    # ponytail: tabsmith 1.0.0 writes the versioned Cellar path into the dotfiles on Linux; drop this line once a
    # release writes the stable bin/ link instead.
    text += "On Linux, run tabsmith doctor after each brew upgrade to repoint the shell integration.\n" if OS.linux?
    text
  end

  test do
    assert_equal "tabsmith #{version}", shell_output("#{bin}/tabsmith --version").strip
  end
end
