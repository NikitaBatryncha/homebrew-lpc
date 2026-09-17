cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "5386070b0d36e9527860332b342cc0bdeb53e5ca97a08aa2fe5b103fa6ccf106",
         intel: "8e2a5fe46d5ffa29add369a25d67fe1eb44664c903b3aafd02a9b8ff829fd164"

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
