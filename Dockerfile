FROM manjarolinux/base
RUN pacman -Syu base-devel --noconfirm
RUN pacman -S zsh git vim tmux wget curl neovim unzip --noconfirm

#RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
#RUN sed -i 's/plugins=(git)/plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

# VOLUME [ "/root" ]

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
ENV PATH="/root/.asdf/bin:$PATH"

RUN /root/.asdf/bin/asdf plugin-add java
RUN /root/.asdf/bin/asdf plugin-add gradle
RUN /root/.asdf/bin/asdf plugin-add maven
RUN /root/.asdf/bin/asdf plugin-add python
RUN /root/.asdf/bin/asdf plugin-add nodejs
RUN /root/.asdf/bin/asdf plugin-add golang
RUN /root/.asdf/bin/asdf plugin-add rust
RUN /root/.asdf/bin/asdf plugin-add ruby
RUN /root/.asdf/bin/asdf plugin-add elixir
RUN /root/.asdf/bin/asdf plugin-add docker-compose-v1
RUN /root/.asdf/bin/asdf plugin-add kompose

RUN /root/.asdf/bin/asdf install java openjdk-16.0.2
RUN /root/.asdf/bin/asdf install gradle 7.4.2
RUN /root/.asdf/bin/asdf install maven 3.8.5
RUN /root/.asdf/bin/asdf install python 3.10.2
RUN /root/.asdf/bin/asdf install nodejs 16.14.2
RUN /root/.asdf/bin/asdf install golang 1.18.1
RUN /root/.asdf/bin/asdf install rust 1.59.0
RUN /root/.asdf/bin/asdf install ruby 3.1.2
RUN /root/.asdf/bin/asdf install elixir 1.9.4-otp-22
RUN /root/.asdf/bin/asdf install docker-compose-v1 1.29.2
RUN /root/.asdf/bin/asdf install kompose 1.26.1

RUN /root/.asdf/bin/asdf global java openjdk-16.0.2
RUN /root/.asdf/bin/asdf global gradle 7.4.2
RUN /root/.asdf/bin/asdf global maven 3.8.5
RUN /root/.asdf/bin/asdf global python 3.10.2
RUN /root/.asdf/bin/asdf global nodejs 16.14.2
RUN /root/.asdf/bin/asdf global golang 1.18.1
RUN /root/.asdf/bin/asdf global rust 1.59.0
RUN /root/.asdf/bin/asdf global ruby 3.1.2
RUN /root/.asdf/bin/asdf global elixir 1.9.4-otp-22
RUN /root/.asdf/bin/asdf global docker-compose-v1 1.29.2
RUN /root/.asdf/bin/asdf global kompose 1.26.1

#COPY zsh-in-docker.sh .
#RUN chmod +x zsh-in-docker.sh

#RUN sh -c "./zsh-in-docker.sh" -- \
#  -t robbyrussell \
#  -p git \
#  -p ssh-agent

# VOLUME [ "/root" ]

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

RUN sed -i 's/plugins=(git)/plugins=(git asdf zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

ENTRYPOINT [ "/bin/zsh" ]
CMD [ "-l" ]
