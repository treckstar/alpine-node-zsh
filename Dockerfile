FROM node:20-alpine

# Will not prompt for questions
ARG DEBIAN_FRONTEND=noninteractive
ARG CONTAINER_USER=node

WORKDIR /home/"${CONTAINER_USER}"

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git starship  curl icu-data-full exa tzdata zsh-syntax-highlighting && \
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    cp -R /root/.oh-my-zsh /home/"${CONTAINER_USER}" && \
    cp /root/.zsh* /home/"${CONTAINER_USER}" && \
    cp -R /usr/share/zsh/plugins/. /home/"${CONTAINER_USER}"/.oh-my-zsh/custom/plugins/. && \
    sed -i "s/\/root/\/home\/${CONTAINER_USER}/g" /home/"${CONTAINER_USER}"/.zshrc && \
    chown -R "${CONTAINER_USER}":"${CONTAINER_USER}" /home/"${CONTAINER_USER}" && \
    chown -R "${CONTAINER_USER}":"${CONTAINER_USER}" /usr/share/zsh && \
    mkdir -p /home/"${CONTAINER_USER}"/.config && \
    starship preset pastel-powerline -o /home/"${CONTAINER_USER}"/.config/starship.toml

# RUN curl -L -o /usr/local/bin/pnpm https://github.com/pnpm/pnpm/releases/download/v8.6.12/pnpm-linux-x64
# ENV PNPM_HOME=/usr/local/bin/
# RUN chmod +x /usr/local/bin/pnpm

#COPY ohmyzsh/.zshrc /home/"${CONTAINER_USER}"/.zshrc
COPY ohmyzsh/.aliases.zsh /home/"${CONTAINER_USER}"/.aliases.zsh


CMD ["/bin/zsh"]