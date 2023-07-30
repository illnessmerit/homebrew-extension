# TODO: Format document
class Extension < Formula
  url "https://github.com/8ta4/extension/releases/download/v0.1.2/extension.tar.gz"
  sha256 "aa475e638c0b329d88d22afa973b66ffb85c2c801cc1e2df1a22b170e651b2ba"

  depends_on "node"

  def install
    # We need to copy the whole directory including output/Main because
    # 'spago build' is being used instead of 'spago bundle-app' due to a
    # problem with dynamic require of 'stream' when using 'bundle-app'.
    # 'spago build' generates 'index.js' in './output/Main/', which needs
    # to be available in the working directory for import.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"index.js" => "extension"
  end
end
