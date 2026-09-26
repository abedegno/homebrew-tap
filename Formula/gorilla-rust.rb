# Written by gorilla-rust's release workflow from
# packaging/homebrew/gorilla-rust.rb.in. Change that, not this.
class GorillaRust < Formula
  desc "Pixel-faithful Rust port of the 1990 QBasic game Gorillas"
  homepage "https://github.com/abedegno/gorilla-rust"
  # The universal macOS build, unless on_linux below picks a Linux one.
  url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.1/gorilla-rust-universal-apple-darwin.tar.gz"
  sha256 "5a1c3f4d494946aee02051c5ba7534786f117ab563640ad9c047946af73cb7d1"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.1/gorilla-rust-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ad3ef161b81ac7f12ff276d7d37ff38064bf9497bd9d63b5f58e3b20ef58f3e"
    end
    on_arm do
      url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.1/gorilla-rust-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01e7daf3c7ae2827627ac56fa23057f35954267de4fed763411efd196a04a3fc"
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
