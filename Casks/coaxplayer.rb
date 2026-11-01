cask "coaxplayer" do
  version "1.0.1"
  sha256 "1c1b944307bf0f1c47b325111b4f4a207b0598fb02cae761a65119add3636c3d"

  url "https://github.com/bellx2/CoaxPlayer/releases/download/v#{version}/CoaxPlayer_#{version}_macos-arm64.zip"
  name "CoaxPlayer"
  desc "Player for terrestrial digital TV received with coax"
  homepage "https://github.com/bellx2/CoaxPlayer"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "CoaxPlayer.app"

  zap trash: [
    "~/Library/Application Support/CoaxPlayer",
    "~/Library/Preferences/jp.bellx2.CoaxPlayer.plist",
  ]
end
