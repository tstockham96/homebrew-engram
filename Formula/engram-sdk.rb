class EngramSdk < Formula
  desc "Persistent memory layer for AI agents - MCP server, REST API, CLI"
  homepage "https://www.engram.fyi"
  url "https://registry.npmjs.org/engram-sdk/-/engram-sdk-0.5.1.tgz"
  sha256 "f5061c381957f24416f6fe824d73675ef8e16d4be4d223a405f4c6478395b88d"
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
