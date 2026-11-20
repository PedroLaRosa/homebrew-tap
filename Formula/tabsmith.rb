class Tabsmith < Formula
  desc "IDE-style autocomplete for your terminal: dropdown menu and inline ghost text"
  homepage "https://github.com/PedroLaRosa/tabsmith"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.1/tabsmith-darwin-arm64"
      sha256 "ff81b9cf52f2ed90f6297bb4025ecca5d446a78c579838063635846b26aa9674"
    end
    on_intel do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.1/tabsmith-darwin-x64"
      sha256 "e3774d833f1357380657fbec092a5858d4628542829ebd08f371ac7243072ac9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.1/tabsmith-linux-arm64"
      sha256 "85e8c22dae39d0ce9b80ab2e3bafd46c0d0d12589eaad1aa976d99df04f0b46f"
    end
    on_intel do
      url "https://github.com/PedroLaRosa/tabsmith/releases/download/v1.0.1/tabsmith-linux-x64"
      sha256 "e44382ea5a0a21f83cd3b20fe87aa3003b754cee07a73d9a3a32d786092ce302"
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
    # ponytail: tabsmith 1.0.0 wrote the versioned Cellar path into the dotfiles on Linux, so an upgrade from it, to
    # whichever later version, needs one doctor run. Delete this once upgrades from 1.0.0 are unlikely.
    if OS.linux?
      text += <<~EOS
        On Linux, after upgrading from tabsmith 1.0.0, run tabsmith doctor once to repoint the shell integration.
      EOS
    end
    text
  end

  test do
    assert_equal "tabsmith #{version}", shell_output("#{bin}/tabsmith --version").strip
  end
end
