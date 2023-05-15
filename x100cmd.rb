# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class X100cmd < Formula
  desc ""
  homepage ""
  version "1.2.2"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bellx2/x100cmd/releases/download/v1.2.2/x100cmd_Darwin_arm64.tar.gz"
      sha256 "57542bcae1dcf0ef5198a2ed48b4b4b162d14aa7f14c5965e2a0374556438e70"

      def install
        bin.install "x100cmd"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bellx2/x100cmd/releases/download/v1.2.2/x100cmd_Darwin_x86_64.tar.gz"
      sha256 "c89883933406f679c23e1d2fe6dfafc926b57d481cf5ef2c0c80eff812610d16"

      def install
        bin.install "x100cmd"
      end
    end
  end
end
