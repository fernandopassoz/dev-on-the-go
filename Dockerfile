FROM manjarolinux/base
RUN pacman -Sy 
RUN pacman -S base-devel --noconfirm
RUN pacman -S zsh git vim tmux wget curl neovim --noconfirm
RUN chsh -s /usr/bin/zsh
RUN zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
RUN sed -i 's/plugins=(git)/plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

RUN export PATH="$HOME/.asdf/bin:$PATH"

RUN ~/.asdf/bin/asdf plugin-add java
RUN ~/.asdf/bin/asdf plugin-add gradle
RUN ~/.asdf/bin/asdf plugin-add maven
RUN ~/.asdf/bin/asdf plugin-add python
RUN ~/.asdf/bin/asdf plugin-add nodejs
RUN ~/.asdf/bin/asdf plugin-add golang
RUN ~/.asdf/bin/asdf plugin-add rust
RUN ~/.asdf/bin/asdf plugin-add ruby
RUN ~/.asdf/bin/asdf plugin-add elixir
RUN ~/.asdf/bin/asdf plugin-add docker-compose-v1
RUN ~/.asdf/bin/asdf plugin-add kompose

RUN ~/.asdf/bin/asdf install java openjdk-16.0.2
RUN ~/.asdf/bin/asdf install gradle 7.4.2
RUN ~/.asdf/bin/asdf install maven 3.8.5
RUN ~/.asdf/bin/asdf install python 3.10.2
RUN ~/.asdf/bin/asdf install nodejs 16.14.2
RUN ~/.asdf/bin/asdf install golang 1.18.1
RUN ~/.asdf/bin/asdf install rust 1.59.0
RUN ~/.asdf/bin/asdf install ruby 3.1.2
RUN ~/.asdf/bin/asdf install elixir 1.9.4-otp-22
RUN ~/.asdf/bin/asdf install docker-compose-v1 1.29.2
RUN ~/.asdf/bin/asdf install kompose 1.26.1

RUN ~/.asdf/bin/asdf global java openjdk-16.0.2
RUN ~/.asdf/bin/asdf global gradle 7.4.2
RUN ~/.asdf/bin/asdf global maven 3.8.5
RUN ~/.asdf/bin/asdf global python 3.10.2
RUN ~/.asdf/bin/asdf global nodejs 16.14.2
RUN ~/.asdf/bin/asdf global golang 1.18.1
RUN ~/.asdf/bin/asdf global rust 1.59.0
RUN ~/.asdf/bin/asdf global ruby 3.1.2
RUN ~/.asdf/bin/asdf global elixir 1.9.4-otp-22
RUN ~/.asdf/bin/asdf global docker-compose-v1 1.29.2
RUN ~/.asdf/bin/asdf global kompose 1.26.1

RUN cat ~/.zshrc
