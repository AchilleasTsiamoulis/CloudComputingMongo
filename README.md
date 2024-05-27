# Cloud Computing Mongo Replica
Η εργασία αυτή ασχολείται με την δημουργία ενός MongoDB instance(container) μέσω Docker. Η συγκεκριμένη βάση δεδομένων έχει ήδη έτοιμο pre-built image, επομένως δεν είναι απαραίτητο να χρησιμοποιηθεί Dockerfile (Docker), αλλά θα υλοποιηθεί με yaml αρχείο μόνο (Docker-compose).  
# Προετοιμασία χρήστη
# Υλοποίηση MongoDB  
Δημιουργία του MongoDB image και των instances.
docker-compose up -d 

Με την εντολή αυτή βλέπουμε όλα τα images του docker
docker images

Με την εντολή αυτή βλέπουμε πληροφορίες του image και όλα τα ενεργά instances
docker ps 

Με την εντολή αυτή χρησιμοποιούμε το πρώτο instance (mongo1) για να τρέξουμε την εντολή mongo και να εισέρθουμε στην βάση MongoDB
docker exec -it mongo1 mongo
