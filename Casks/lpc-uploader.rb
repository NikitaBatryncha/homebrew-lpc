cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.7"
  sha256 arm:   "f104edb6bab6376c9d8733094abf8362dd3a9d35b939091e5f11c97a20c6734d",
         intel: "f25a01e98e7177b1db0031f5624f8a6e51c2b443f05da108049303333d7ea1f1"

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
