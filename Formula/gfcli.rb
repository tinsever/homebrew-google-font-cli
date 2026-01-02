require "language/node"

class Gfcli < Formula
  desc "Download and install Google Web Fonts on your local machine"
  homepage "https://github.com/tinsever/google-font-cli"
  url "https://github.com/tinsever/google-font-cli/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "b5c40edbe1ba45f5f641925b0a543b74545d159d55adad5ee85a0daa590a6feb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_args(libexec)
    bin.install_symlink "#{libexec}/bin/gfcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gfcli --version")
    output = shell_output("#{bin}/gfcli --help")
    assert_match "Usage: gfcli", output
  end
end
