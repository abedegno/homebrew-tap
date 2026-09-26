# Written by gorilla-rust's release workflow from
# packaging/homebrew/gorilla-rust.rb.in. Change that, not this.
class GorillaRust < Formula
  desc "Pixel-faithful Rust port of the 1990 QBasic game Gorillas"
  homepage "https://github.com/abedegno/gorilla-rust"
  # The universal macOS build, unless on_linux below picks a Linux one.
  url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.0/gorilla-rust-universal-apple-darwin.tar.gz"
  sha256 "4cb15e91bba6014687ceefbf50804893a9c180088450c01d6873740ecab8b134"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.0/gorilla-rust-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb1ce89f96cc3dc1105306b7a37ad5f1e3efd2d86616a32bae1cf3f0e8431fd6"
    end
    on_arm do
      url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.0/gorilla-rust-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0f1d2668be6141f1bdcf5573799615c496e7e5ccb5c5e3c42dba790d9c63637"
    end
  end

  def install
    bin.install "gorilla-rust"
  end

  # Homebrew only rewrites library paths when it pours a bottle, so this
  # prebuilt binary loads ALSA and X11 from the system, not from Homebrew.
  def caveats
    on_linux do
      <<~EOS
        gorilla-rust needs the system's ALSA to start, and X11 with Xcursor
        and xkbcommon to open its window. Most desktops have them already.
        If it reports a missing library:
          sudo apt-get install libasound2t64 libx11-6 libxcursor1 libxkbcommon0   # Ubuntu 24.04+, Debian 13+
          sudo apt-get install libasound2 libx11-6 libxcursor1 libxkbcommon0      # older Debian and Ubuntu
          sudo dnf install alsa-lib libX11 libXcursor libxkbcommon                # Fedora
      EOS
    end
  end

  test do
    assert_equal "gorilla-rust #{version}", shell_output("#{bin}/gorilla-rust --version").strip
  end
end
