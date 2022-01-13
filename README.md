# configs
This repo will contain my configurations of tmux, oh-my-zsh and nvim

#Step 1

Get sure that on .bashrc you include the `exports` related to the environment variables.

#Step2

Install zsh
```bash
sudo apt-get update
sudo apt-get install zsh
zsh --version
whereis zsh
```

#step3

Initialize oh-my-zsh

```bash
git submodule init ohmyzsh
```

```bash
git submodule update
```

and also install the theem you are currentlu using

in my case:
```bash
git clone https://github.com/sobolevn/sobole-zsh-theme.git ln -s $PWD/sobole-zsh-theme/sobole.zsh-theme ~/.oh-my-zsh/custom/themes/sobole.zsh-theme
```

#step4

Install nodejs as almoste moste of nvim plugins need that.

```bash
sudo apt install npm
npm cache clean -f
sudo npm install -g n
sudo n stable
```
#step5

Install tmux
```bash
sudo apt install tmux
```

Create a sLink with .thux.conf and tmux-packtheme, be careful that the name of the .tmux-themepack in home directory should be .tmux-themepack

example
```bash
ln -s ~/overall_configs/tmux-themepack .tmux-themepack
```

