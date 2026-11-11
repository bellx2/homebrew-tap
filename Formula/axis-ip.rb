class AxisIp < Formula
  desc "Discover Axis cameras over mDNS and change their IPv4 address via VAPIX"
  homepage "https://github.com/bellx2/axis-ip"
  url "https://github.com/bellx2/axis-ip/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "55d9334b2deb77ca2090180894fe5074d25aebd606a94131aded377bf432b414"
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
