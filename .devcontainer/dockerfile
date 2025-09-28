# Base image: Red Hat Universal Base Image (UBI 9 Minimal)
FROM registry.access.redhat.com/ubi9/ubi-minimal

LABEL maintainer="Nishant <you@example.com>"
ENV TZ=Asia/Kolkata
SHELL ["/bin/bash", "-lc"]

# Install only the absolute essentials
RUN microdnf update -y \
 && microdnf install -y \
    git \
    neovim \
    sudo \
    shadow-utils \
 && microdnf clean all

# Create non-root user (for VS Code / Codespaces)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid ${USER_GID} ${USERNAME} \
 && useradd -m --uid ${USER_UID} --gid ${USER_GID} -s /bin/bash ${USERNAME} \
 && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
 && chmod 0440 /etc/sudoers.d/${USERNAME}

WORKDIR /workspace
USER ${USERNAME}
ENV HOME=/home/${USERNAME}

# Default shell
CMD ["bash"]
