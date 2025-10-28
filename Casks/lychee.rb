cask "lychee" do
  version "0.2.0"
  sha256 "961ad4f2d652756cafd1245d84e665e58571fdb8a31cca11b9fa0543bd9204cb" # Will be calculated when you create a GitHub release

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
