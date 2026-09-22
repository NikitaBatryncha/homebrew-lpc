cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.1.3"
  sha256 arm:   "76cc0d2218c575864d563fd0750cbb0c11ae1c297e4dcd2b9395d98aa61b15e2",
         intel: "313ddc20f89d8a26b906efb4c0088248c9c2dafa8429fc94d4606cb140c820ef"

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
