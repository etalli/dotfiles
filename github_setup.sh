# 1) 鍵を作成（メールはGitHubのメアドでOK）
ssh-keygen -t ed25519 -C "myemail"
# → 保存先はそのまま Enter（~/.ssh/id_ed25519）
# → passphrase は推奨（空でも可）

# 2) ssh-agent 起動 & キーチェーンに登録（macOS向け）
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# 3) 公開鍵をクリップボードへ
pbcopy < ~/.ssh/id_ed25519.pub
# クリップボードに入った公開鍵を GitHub に登録：
# GitHub > Settings > SSH and GPG keys > New SSH key に貼り付け
