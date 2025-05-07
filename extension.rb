# frozen_string_literal: true

# This class represents a Homebrew formula for the extension project.
class Extension < Formula
  url 'https://github.com/8ta4/extension/releases/download/v0.3.1/extension.tar.gz'
  sha256 '8d75285dac2f4ee97c3522e03cfb01933b5d94378e7e9e4d6111aad544c387cd'
  depends_on 'node'
  def install
    libexec.install Dir['*']
    (bin / 'extension').write <<~SHELL
      #!/bin/sh
      exec "#{Formula['node'].opt_bin}/node" "#{libexec}/main.js" "$@"
    SHELL
  end
end
