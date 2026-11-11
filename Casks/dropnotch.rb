cask "dropnotch" do
  version "0.2.0"
  sha256 "4a970ba8a50f20f9d0b13ae8f9ee46dacbf40ee708eecdfb2a6d1e3778141fe9"

  url "https://github.com/Shashwat-19/DropNotch/releases/download/v#{version}/DropNotch-#{version}.dmg"
  name "DropNotch"
  desc "Turns the MacBook notch into a productivity surface"
  homepage "https://github.com/Shashwat-19/DropNotch"

  depends_on macos: :sonoma

  app "DropNotch.app"

  zap trash: [
    "~/Library/Application Support/DropNotch",
    "~/Library/Preferences/com.shashwat.DropNotch.plist",
  ]

  caveats <<~EOS
    DropNotch is not notarised, so macOS blocks its first launch.
    Open it once, click Done, then go to
      System Settings › Privacy & Security
    and click Open Anyway.
  EOS
end
