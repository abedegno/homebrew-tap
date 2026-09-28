# Written by gorilla-rust's release workflow from
# packaging/homebrew/gorillas.rb.in. Change that, not this.
cask "gorillas" do
  version "1.5.0"
  sha256 "7193a65487cd7460d8d718212714346cfaa5d011ca343832efee218bdcf5d3e7"

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
