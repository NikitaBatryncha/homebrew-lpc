cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "b355fc7ee99f269425eed0880284a67c7e517385b55b0461b1271675636ce537",
         intel: "be15c1fbe2afd0177bbcbc3d4cbf7ab348a337cf4208146d41aeb0566a15c6d8"

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
