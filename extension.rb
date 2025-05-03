# frozen_string_literal: true

# This class represents a Homebrew formula for the extension project.
class Extension < Formula
  url 'https://github.com/8ta4/extension/releases/download/v0.3.0/extension.tar.gz'
  sha256 'e93fc8f27087086368b020faba886f687959da6a30b72df9224d9268ca52a8ba'
  depends_on 'node'
  def install
    # We need to copy the whole directory including output/Main because
    # 'spago build' is being used instead of 'spago bundle-app' due to a
    # problem with dynamic require of 'stream' when using 'bundle-app'.
    # 'spago build' generates 'index.js' in './output/Main/', which needs
    # to be available in the working directory for import.
    libexec.install Dir['*']
    bin.install_symlink libexec / 'index.js' => 'extension'
  end
end
