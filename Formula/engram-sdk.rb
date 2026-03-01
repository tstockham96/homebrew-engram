class EngramSdk < Formula
  desc "Persistent memory layer for AI agents - MCP server, REST API, CLI"
  homepage "https://www.engram.fyi"
  url "https://registry.npmjs.org/engram-sdk/-/engram-sdk-0.5.2.tgz"
  sha256 "8158b51f2a33224a91a3135fb74462d97ca156c52ce4072543d19748729768e1"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/engram"
    bin.install_symlink libexec/"bin/engram-serve"
    bin.install_symlink libexec/"bin/engram-mcp"
  end

  def post_install
    ohai "Run 'engram init' to set up Engram with Claude Code, Cursor, or any MCP client"
  end

  test do
    assert_match "engram", shell_output("#{bin}/engram --version")
  end
end
