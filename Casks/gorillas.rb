# Written by gorilla-rust's release workflow from
# packaging/homebrew/gorillas.rb.in. Change that, not this.
cask "gorillas" do
  version "1.4.1"
  sha256 "863ba53fb64481d247b8f4265baec5be3f91af5db4e0d6c543e28dfd980ed181"

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
