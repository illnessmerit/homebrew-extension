class Extension < Formula
  url "https://github.com/8ta4/extension/releases/download/v0.1.0/extension.tar.gz"
  sha256 "416a7560b5a32eed676fe82be239fff70c4e679631c3197aeca625a5d6e31f65"

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
