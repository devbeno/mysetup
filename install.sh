# install packages
sudo apt-get update; sudo apt-get install -y tmux curl zsh ruby-dev git terminator vim python-pip xclip ctags ack-grep
sudo gem install tmuxinator

# install cheat 
wget https://github.com/cheat/cheat/releases/download/4.1.1/cheat-linux-amd64.gz
gunzip cheat-linux-amd64.gz && sudo mv ./cheat-linux-amd64 /usr/local/bin/cheat
sudo chmod +x /usr/local/bin/cheat
mkdir -p ~/.config/cheat/
mv cheat-conf.yaml ~/.config/cheat/conf.yml
mv cheat-notebook.yaml ~/.config/cheat/notebook.yml
rm -rf ~/.oh-my-zsh/

git clone git@bitbucket.org:devbens/cheatsheet.git ~/.cheat-data/personal/
git clone https://github.com/cheat/cheatsheets.git  ~/.cheat-data/community/
git clone git@github.com:devbens/notebook.git ~/.cheat-data/notebook/

# install ohMyZsh - tmux 
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/devbens/.tmux.git
cp .tmux/.tmux.conf ~/
cp .tmux/.tmux.conf.local ~/
cp -r .tmuxinator ~/
cp -r terminator ~/.config
cp .zshrc ~/
cp .zshenv ~/
cp .p10k.zsh ~/

mkdir -p ~/work

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install nvim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo cp nvim.appimage /usr/local/bin/nvim
sudo chmod 755 /usr/local/bin/nvim
rm nvim.appimage

# install space-vim - https://github.com/liuchengxu/space-vim 
bash <(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)

# vim config
cp .spacevim ~/.spacevim

git config --global core.hooksPath ~/.githooks
mkdir ~/.githooks
cp commit-msg ~/.githooks/commit-msg
chmod +x ~/.githooks/commit-msg

sudo npm install -g @commitlint/cli @commitlint/config-conventional
echo "module.exports = {extends: ['@commitlint/config-conventional']}" > ~/commitlint.config.js

