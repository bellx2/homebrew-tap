class AxisIp < Formula
  desc "Discover Axis cameras over mDNS and change their IPv4 address via VAPIX"
  homepage "https://github.com/bellx2/axis-ip"
  url "https://github.com/bellx2/axis-ip/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "a5d596c6860a1eb86b9cab297b2c9cd10e98e5b3b0689233fe6a481331cb4a29"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    # 探索に macOS の DNS-SD API を cgo で使う
    ENV["CGO_ENABLED"] = "1"
    system "go", "build", *std_go_args
  end

  test do
    assert_match "axis-ip #{version}", shell_output("#{bin}/axis-ip version")
  end
end
