require "language/node"

class Gfcli < Formula
  desc "Download and install Google Web Fonts on your local machine. Both CLI and API available."
  homepage "https://github.com/tinsever/google-font-cli"
  url "https://github.com/tinsever/google-font-cli/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "e7c453c2820a26f8f09efe227fc91d8983cb6df0842cf9b09cff54e96e56e989"
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
