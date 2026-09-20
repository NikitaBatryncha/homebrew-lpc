cask "lpc-uploader" do
  arch arm: "arm64", intel: "x64"

  version "1.0.5"
  sha256 arm:   "06225be99f263628f18c9458e063bba70b6088dfb9b33f518f654826b098afa9",
         intel: "5f7c387645bbaeb039142509a2e0ebaebedec11c4c9f7a5d21de327430190883"

  url "https://github.com/NikitaBatryncha/lpc-uploader-releases/releases/download/v#{version}/LPC-Uploader-#{version}-#{arch}.dmg",
      verified: "github.com/NikitaBatryncha/lpc-uploader-releases/"
  name "LPC Uploader"
  desc "Фоновый сервер для Figma-плагина LPC"
  homepage "https://github.com/NikitaBatryncha/lpc-uploader-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :big_sur"

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
    Приложение работает в меню-баре (LSUIElement, без окна и иконки в Dock).
    Подключение плагина: Figma → Plugins → Development → Import plugin from manifest…
    и выберите ~/LPC Uploader Figma Plugin/manifest.json
  EOS
end
