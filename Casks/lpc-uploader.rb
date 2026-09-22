cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.1.1"
  sha256 arm:   "820681112998d93912fdd5793ef18ba8155610c6bc384b2749a4fe1d6eacbbab",
         intel: "5a3cf5e7f306f630e16cee4e35716cec8e0f4cdfc1f7fd9a6ec2d8f72bd7de01"

  url "https://github.com/NikitaBatryncha/lpc-uploader-releases/releases/download/v#{version}/lpc-uploader-#{version}-#{arch}.dmg"
  name "LPC Uploader"
  desc "Фоновый сервер для загрузки ассетов из Figma-плагина"
  homepage "https://github.com/NikitaBatryncha/lpc-uploader-releases"

  depends_on :macos

  app "LPC Uploader.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "/Applications/LPC Uploader.app"]
  end

  zap trash: [
    "~/Library/Application Support/LPC Uploader",
    "~/Library/Logs/LPC Uploader",
    "~/Library/Preferences/com.lpc.uploader.plist",
  ]
end
