cask "coaxplayer" do
  version "1.0.3"
  sha256 "beca76f31db432549c4038c1058ff478abd384c3e1276907ef31a32c9c3578be"

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
