# TODO: Format document
class Extension < Formula
  url "https://github.com/8ta4/extension/releases/download/v0.1.1/extension.tar.gz"
  sha256 "827253f5f50ebe8bab04a3ca6687394dd05e42d949731ea01ae610a9a90eaddf"

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
