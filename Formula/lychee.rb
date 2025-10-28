class Lychee < Formula
  desc "Browser-based interface for Claude Code"
  homepage "https://github.com/datafruit-dev/lychee"
  url "https://github.com/datafruit-dev/lychee/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5734d3f495c777dd7fecabec29b7039c92a544ad81c151f519cbdcef19b1a619"
  license "MIT"
  head "https://github.com/datafruit-dev/lychee.git", branch: "main"

  depends_on "rust" => :build
  depends_on "node" => :build

  def install
    # Build frontend static files
    cd "frontend" do
      system "npm", "install"
      system "npm", "run", "build"
    end

    # Build and install Rust binary (with embedded frontend)
    system "cargo", "install", "--locked", "--path", "cli", "--root", prefix
  end

  def caveats
    <<~EOS
      Lychee has been installed!

      Usage:
        lychee up      # Start server (relay + frontend)
        lychee         # Connect client to current repository

      The server will start on:
        - Relay:    ws://localhost:7331
        - Frontend: http://localhost:7332

      Browser will auto-open when you run 'lychee up'.
    EOS
  end

  test do
    # Test that the binary runs and shows version
    assert_match "lychee", shell_output("#{bin}/lychee --version")
  end
end
