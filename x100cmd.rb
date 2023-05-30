# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class X100cmd < Formula
  desc ""
  homepage ""
  version "1.3.5"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bellx2/x100cmd/releases/download/v1.3.5/x100cmd_Darwin_arm64.tar.gz"
      sha256 "f16c3113ab92b7410bfc40ea0f6bab2f98217e04eadea3d76118cf5721ac4cc5"

      def install
        bin.install "x100cmd"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bellx2/x100cmd/releases/download/v1.3.5/x100cmd_Darwin_x86_64.tar.gz"
      sha256 "a906009de8db8a524188bd48e07d19716994cbb9dc97b324eb4476079fa8d77c"

      def install
        bin.install "x100cmd"
      end
    end
  end
end
