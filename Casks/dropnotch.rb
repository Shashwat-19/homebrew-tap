cask "dropnotch" do
  version "0.3.2"
  sha256 "61927c4d610e86a3edd463b663f050961cc432fa83fb642cd82f550e5908333f"

  url "https://github.com/Shashwat-19/DropNotch/releases/download/v#{version}/DropNotch-#{version}.dmg"
  name "DropNotch"
  desc "Turns the MacBook notch into a productivity surface"
  homepage "https://github.com/Shashwat-19/DropNotch"

  # The block keeps pre-releases, which the default :github_releases and :github_latest both skip.
  livecheck do
    url :url
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        release["tag_name"]&.[](regex, 1)
      end
    end
  end

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
