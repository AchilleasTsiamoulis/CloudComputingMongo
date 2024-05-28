#!/bin/bash

# Δημιουργία καταλόγου
mkdir -p CloudComputingMongoReplica 

# Ενημέρωση repositories 
sudo apt update

# Εγκατάσταση Docker
sudo apt install -y docker.io

# Εγκατάσταση Docker Compose
sudo apt install -y docker-compose

# Μετακίνηση στον κατάλογο
cd CloudComputingMongoReplica
$SHELL