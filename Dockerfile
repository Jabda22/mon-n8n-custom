FROM n8nio/n8n:latest

# Passer en root pour installer les paquets
USER root

# Alpine Linux utilise apk au lieu d'apt-get
RUN apk update && apk add --no-cache \
    ffmpeg \
    poppler-utils \
    imagemagick \
    ghostscript \
    && rm -rf /var/cache/apk/*

# Revenir à l'utilisateur n8n
USER node

# Exposer le port
EXPOSE 5678

# Commande par défaut
CMD ["n8n"]
