cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.3"
  sha256 arm:   "03b7c68a98444acc385677532cbb6723bc2a5fa94b5e7f85fcd8180c0b435e43",
         intel: "31910f9c39aa40c37b1323a696dbc4d5407182d861fb346e2313b865ab29f53e"

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
