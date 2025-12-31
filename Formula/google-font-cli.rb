require "language/node"

class Gfcli < Formula
  desc "Download and install Google Web Fonts on your local machine. Both CLI and API available."
  homepage "https://github.com/tinsever/google-font-cli"
  url "https://github.com/tinsever/google-font-cli/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "68f7d3ed7f7d2496282c48e4baa17984be414798d0a71af9c4f98b8bedb29657"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink "#{libexec}/bin/gfcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gfcli --version")
    output = shell_output("#{bin}/gfcli --help")
    assert_match "Usage: gfcli", output
  end
end
