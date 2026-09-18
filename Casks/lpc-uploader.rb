cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.5"
  sha256 arm:   "06225be99f263628f18c9458e063bba70b6088dfb9b33f518f654826b098afa9",
         intel: "a870559e1c8907d18b0387e15c755a383fc9215c5c5f2843bd6c807480b1d2df"

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
