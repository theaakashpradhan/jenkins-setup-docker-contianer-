FROM jenkins/jenkins:lts

# Install Docker
USER root
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    vim \
    gnupg-agent \
    software-properties-common \
    lsb-release \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Ensure Jenkins user can run Docker commands
RUN usermod -aG docker jenkins

USER jenkins


