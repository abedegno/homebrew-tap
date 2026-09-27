# Written by gorilla-rust's release workflow from
# packaging/homebrew/gorilla-rust.rb.in. Change that, not this.
class GorillaRust < Formula
  desc "Pixel-faithful Rust port of the 1990 QBasic game Gorillas"
  homepage "https://github.com/abedegno/gorilla-rust"
  # The universal macOS build, unless on_linux below picks a Linux one.
  url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.2/gorilla-rust-universal-apple-darwin.tar.gz"
  sha256 "21c7d7e8ccd93fa2ba83712f690414f8a93ed85752544c937451306ce2717d7f"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.2/gorilla-rust-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d7574a4c69481f2f015d896c76afe5af5e72339e59735b3e402ff939282d177"
    end
    on_arm do
      url "https://github.com/abedegno/gorilla-rust/releases/download/v1.4.2/gorilla-rust-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7107ad48e044e7499d78e0007b59bab494858dc683250e6f1a9549bf15bcba2"
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
