# date: 2025-10-30
# 1) make ssh key (email is OK for GitHub)
ssh-keygen -t ed25519 -C "myemail"
# passphrase is recommended (empty is OK)

# 2) start ssh-agent and register to keychain (for macOS)
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# 3) copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub

# 4) register public key to GitHub:
# GitHub > Settings > SSH and GPG keys > New SSH key > paste public key

# 5) test ssh connection
ssh -T git@github.com
