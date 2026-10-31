class Libaribb25 < Formula
  desc "ARIB STD-B1/B25 library and tools, built with pcsc-lite for macOS"
  homepage "https://github.com/bellx2/libaribb25"
  url "https://github.com/bellx2/libaribb25/archive/refs/tags/macos-0.2.10.tar.gz"
  sha256 "d9f2e078937163ed77a51ce1fc98b2200bebae6890ec2817bef0785d45126193"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on arch: :arm64
  depends_on :macos

  # macOS 標準の PCSC.framework ではなく pcsc-lite を使う（PCSCLITE_CSOCK_NAME で接続先のソケットを選べるため）
  resource "pcsc-lite" do
    url "https://pcsclite.apdu.fr/files/pcsc-lite-2.5.3.tar.xz"
    sha256 "fe2bb733ecf95e52768907eb00da9f9f3daf180960283e514a05dcc090afa3bd"
  end

  def install
    pcsc = buildpath/"pcsc-prefix"
    # 共有ライブラリの libpcsclite は実体を名前で dlopen するので、静的ライブラリにしてリンクする
    resource("pcsc-lite").stage do
      system "meson", "setup", "build", "--prefix=#{pcsc}", "--buildtype=release", "-Ddefault_library=static",
             "-Dlibsystemd=false", "-Dlibudev=false", "-Dlibusb=false", "-Dpolkit=false",
             "-Dusb=false", "-Dserial=false"
      system "meson", "install", "-C", "build"
      (share/"licenses/pcsc-lite").install "COPYING"
    end

    ENV.prepend_path "PKG_CONFIG_PATH", pcsc/"lib/pkgconfig"
    system "cmake", "-S", ".", "-B", "build", "-DWITH_PCSC_PACKAGE=libpcsclite",
           "-DCMAKE_PROJECT_INCLUDE=#{buildpath}/scripts/macos-pcsc.cmake",
           "-DCMAKE_INSTALL_RPATH=#{rpath}", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
    (share/"licenses/libaribb25").install "LICENSE", "NOTICE"
  end

  test do
    assert_match "version #{version}", shell_output("#{bin}/arib-b25-stream-test -h 2>&1", 1)
  end
end
