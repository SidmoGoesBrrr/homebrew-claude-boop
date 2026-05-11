class ClaudeBoop < Formula
  desc "Cute notifications for Claude Code (permission prompts & generation complete)"
  homepage "https://github.com/akeenkarkare/homebrew-claude-boop"
  url "https://github.com/akeenkarkare/homebrew-claude-boop/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "c9a55c7b35b97e1c6b2cdffa45d08e5dcef22ff5b524ab1621989800d3f8d014"
  license "MIT"
  head "https://github.com/akeenkarkare/homebrew-claude-boop.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "claude-boop", shell_output("#{bin}/claude-boop --version")
  end
end
