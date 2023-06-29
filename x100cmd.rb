# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class X100cmd < Formula
  desc ""
  homepage ""
  version "1.3.8"
  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bellx2/x100cmd/releases/download/v1.3.8/x100cmd_Darwin_x86_64.tar.gz"
      sha256 "64a1a324186eb9d8ee1affc748cb5d414681b5173b9cc35d5f74bc69b3b415c3"

      def install
        bin.install "x100cmd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/bellx2/x100cmd/releases/download/v1.3.8/x100cmd_Darwin_arm64.tar.gz"
      sha256 "003705d10bd394b65268f3b74263e816f6cb523e684cdddecb8b5bd50df82e4e"

      def install
        bin.install "x100cmd"
      end
    end
  end
end
