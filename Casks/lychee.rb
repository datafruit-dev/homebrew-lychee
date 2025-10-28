cask "lychee" do
  version "0.2.0"
  sha256 "593ad9add9513a0266ddc7bb083e7e4bcac7e1c9cebfc95419f097eda0231d88" # Will be calculated when you create a GitHub release

  url "https://github.com/datafruit-dev/lychee/releases/download/v#{version}/Lychee_#{version}_aarch64.dmg"
  name "Lychee"
  desc "Native macOS menu bar app for Claude Code"
  homepage "https://github.com/datafruit-dev/lychee"

  # Requires lychee CLI to be installed (for spawning clients)
  depends_on formula: "datafruit-dev/lychee/lychee"

  app "Lychee.app"

  zap trash: [
    "~/Library/Application Support/Lychee",
    "~/Library/Logs/Lychee",
  ]
end
