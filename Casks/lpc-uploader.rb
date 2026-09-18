cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.2"
  sha256 arm:   "2d6862bd441e53182dca3304f845c4ae2bceaee9a730dab3da6288abc4bf5f50",
         intel: "169c292c97ec79f433846c92e7f91ee4f07845d74d3d4a71e84e5c64bccca086"

  url "https://github.com/NikitaBatryncha/lpc-uploader-releases/releases/download/v#{version}/LPC-Uploader-#{version}-#{arch}.zip"
  name "LPC Uploader"
  desc "Фоновый сервер для загрузки ассетов из Figma-плагина"
  homepage "https://github.com/NikitaBatryncha/lpc-uploader-releases"

  depends_on macos: ">= :big_sur"

  app "LPC Uploader.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/LPC Uploader.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/LPC Uploader",
    "~/Library/Logs/LPC Uploader",
    "~/Library/Preferences/com.lpc.uploader.plist",
  ]
end
