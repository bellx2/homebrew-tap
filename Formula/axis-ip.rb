class AxisIp < Formula
  desc "Discover Axis cameras over mDNS and change their IPv4 address via VAPIX"
  homepage "https://github.com/bellx2/axis-ip"
  url "https://github.com/bellx2/axis-ip/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "cc90261bb860da74585a6ac1d1b8e04bf93ca60f8a4c0a68be21a3304e4d481f"
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
