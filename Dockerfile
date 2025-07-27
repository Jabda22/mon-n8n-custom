FROM n8nio/n8n:latest

# Passer en root pour installer les paquets
USER root

# Mettre à jour les paquets et installer FFmpeg + Poppler + ImageMagick
RUN apt-get update && apt-get install -y \
    ffmpeg \
    poppler-utils \
    imagemagick \
    ghostscript \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Revenir à l'utilisateur n8n
USER node

# Exposer le port
EXPOSE 5678

# Commande par défaut
CMD ["n8n"]
