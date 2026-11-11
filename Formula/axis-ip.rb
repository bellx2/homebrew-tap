class AxisIp < Formula
  desc "Discover Axis cameras over mDNS and change their IPv4 address via VAPIX"
  homepage "https://github.com/bellx2/axis-ip"
  url "https://github.com/bellx2/axis-ip/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "9a85e1c82254b945cec8e6feb0e20fd73448d34d4cb246a321bb3c89d0d8d7cd"
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
