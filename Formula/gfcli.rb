class Gfcli < Formula
  desc "Download and install Google Web Fonts on your local machine. Both CLI and API available."
  homepage "https://github.com/tinsever/google-font-installer"
  url "https://github.com/tinsever/google-font-installer/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "e7c453c2820a26f8f09efe227fc91d8983cb6df0842cf9b09cff54e96e56e989"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink "#{libexec}/bin/gfcli"
  end
end
