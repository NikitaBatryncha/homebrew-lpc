cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.6"
  sha256 arm:   "9e19cf528dc415bc0bdbf717157365422d8166df14db002f45c73026ac2c70e2",
         intel: "bdf9d135aa778c933c61000f4d64dc0f671a7b7cb64e6fefbe1760361ca2d556"

  url "https://github.com/NikitaBatryncha/lpc-uploader-releases/releases/download/v#{version}/lpc-uploader-#{version}-#{arch}.dmg"
  name "LPC Uploader"
  desc "Фоновый сервер для Figma-плагина LPC"
  homepage "https://github.com/NikitaBatryncha/lpc-uploader-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on :macos

  app "LPC Uploader.app"

  uninstall quit:       "com.lpc.uploader",
            login_item: "LPC Uploader"

  zap trash: [
    "~/Library/Application Support/LPC Uploader",
    "~/Library/Logs/LPC Uploader",
    "~/Library/Preferences/com.lpc.uploader.plist",
    "~/Library/Saved Application State/com.lpc.uploader.savedState",
    "~/LPC Uploader Figma Plugin",
  ]

  caveats <<~EOS
    Приложение не подписано сертификатом Apple Developer.
    Устанавливать нужно с флагом --no-quarantine:

      brew install --cask --no-quarantine #{token}

    Если приложение уже установлено без флага и macOS считает его повреждённым:

      xattr -dr com.apple.quarantine "/Applications/LPC Uploader.app"

    Приложение работает в меню-баре (без окна и иконки в Dock).
    Плагин: Figma → Plugins → Development → Import plugin from manifest…
    и выберите ~/LPC Uploader Figma Plugin/manifest.json
  EOS
end
