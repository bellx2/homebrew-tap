cask "coaxplayer" do
  version "1.0.8"
  sha256 "428933da001d47eead371e17a16c840bb6f212acb40b561dd84d9fad339d7239"

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
