#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <nombre_instances>"
    exit 1
fi

NB_INSTANCES=$1
BASE_PORT=8080

for i in $(seq 1 $NB_INSTANCES); do
    PORT=$((BASE_PORT + i - 1))
    INSTANCE_NAME="instance$i"
    
    echo "🚀 Déploiement de $INSTANCE_NAME sur le port $PORT..."
    
    # Créer le fichier .env
    cat > ".env.$INSTANCE_NAME" << EOF
INSTANCE_NAME=$INSTANCE_NAME
WEB_PORT=$PORT
EOF
    
    # Lancer docker-compose
    docker-compose --env-file ".env.$INSTANCE_NAME" --project-name "$INSTANCE_NAME" up -d
done

echo "Toutes les instances sont lancées"