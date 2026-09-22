cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.1.2"
  sha256 arm:   "a16e63e7bdd2c0e0ead82d532905d46057a0a97a2ab888d0cb39e6dcce327721",
         intel: "acd7908404a7327946344af17af01a2f3d33bdc746113abff1e17b70ccbf79f0"

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
