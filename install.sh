apt-get update -qq && \
apt-get install -y \
        netcat \
        build-essential \
        ruby-all-dev \
        libreadline-dev \
        libpq-dev \
        sudo \
        chrpath \
        libssl-dev \
        libxft-dev \
        libfreetype6-dev \
        libfreetype6 \
        libfontconfig1-dev \
        libfontconfig1 \
        libsqlite3-dev \
        vim \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        openssh-server \
        zsh \
        jq \
        bc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && cp -R /root/.oh-my-zsh /home/$USERNAME \
    && cp /root/.zshrc /home/$USERNAME \
    && sed -i -e "s/\/root\/.oh-my-zsh/\/home\/$USERNAME\/.oh-my-zsh/g" /home/$USERNAME/.zshrc \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME/.oh-my-zsh /home/$USERNAME/.zshrc

mkdir -p ~/.vim/pack/vendor/start
git clone --depth 1 https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc

source ~/.zshrc
source ~/.vimrc
