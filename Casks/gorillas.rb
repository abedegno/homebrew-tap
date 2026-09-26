# Written by gorilla-rust's release workflow from
# packaging/homebrew/gorillas.rb.in. Change that, not this.
cask "gorillas" do
  version "1.4.0"
  sha256 "1fe372e6f5da4533a2fe02cea2e2cea6fd7cba53b561751c2cbbe028f0b13400"

  url "https://github.com/abedegno/gorilla-rust/releases/download/v#{version}/Gorillas-#{version}.dmg"
  name "Gorillas"
  desc "Pixel-faithful Rust port of the 1990 QBasic game Gorillas"
  homepage "https://github.com/abedegno/gorilla-rust"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Gorillas.app"

  zap trash: "~/Library/Saved Application State/uk.org.jonwilliams.gorilla-rust.savedState"
end
