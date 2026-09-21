cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.6"
  sha256 arm:   "ed0e39ad56a88f07c698779de9f3b958fe89bed72923034049c9384bf86e8968",
         intel: "a38f507ae4a366c345a7746b17939297d489c3dd401121ff285d2c38cddfc1e1"

  url "https://github.com/NikitaBatryncha/lpc-uploader-releases/releases/download/v#{version}/LPC-Uploader-#{version}-#{arch}.zip"
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
