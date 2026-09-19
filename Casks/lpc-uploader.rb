cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.5"
  sha256 arm:   "1ed1ba647fd22b7dfe62e32b054e99e5a7d6007435f0f2029213e6f73dafa3e2",
         intel: "113222c38256b61640d6b53c109fe90d8739670ee455329abcdbc3d1a7f16689"

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
