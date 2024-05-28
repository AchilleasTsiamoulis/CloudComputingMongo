# Cloud Computing Mongo Replica
Η εργασία αυτή ασχολείται με την δημουργία ενός MongoDB instance(container) μέσω Docker. Η συγκεκριμένη βάση δεδομένων έχει ήδη έτοιμο pre-built image, επομένως δεν είναι απαραίτητο να χρησιμοποιηθεί Dockerfile (Docker), αλλά θα υλοποιηθεί με yaml αρχείο μόνο (Docker-compose).  
# Προετοιμασία χρήστη
Στο σημείο αυτό, ο χρήστης (εαν το επιθυμεί) μπορεί να τρέξει το script με όνομα prepare.sh. Αυτό, δημιουργεί έναν νέο κατάλογο στο μηχάνημα του, κάνει ενημέρωση όλων των repositories και εγκαθιστά το docker και το docker-compose που είναι απαραίτητα για την υλοποίηση της βάσης δεδομένων.
Αρχικά, πρέπει να αλλάξει-προσθέσει δικαίωμα εκτέλεσης στο αρχείο με την εντολή:
-     chmod +x prepare.sh
Έπειτα μπορεί να τρέξει το script με την εντολή:
-     ./prepare.sh

# Υλοποίηση MongoDB  

### Δημιουργία του MongoDB image και των instances. <br />
-     docker-compose up -d

### Με την εντολή αυτή βλέπουμε όλα τα images του docker. <br />
-     docker images

### Με την εντολή αυτή βλέπουμε πληροφορίες του image και όλα τα ενεργά instances. <br />
-     docker ps 

### Με την εντολή αυτή χρησιμοποιούμε το πρώτο instance (mongo1) για να τρέξουμε την εντολή mongo και να εισέρθουμε στην βάση MongoDB. <br />
-     docker exec -it mongo1 mongo

### Την εντολή αυτή την εισάγουμε μέσα στην MongoDB και δημιουργεί το replica μας.
-     rs.initiate( 
        { 
          _id: "rs0", 
          members: [ 
            { _id: 0, host: "mongo1:27017" }, 
            { _id: 1, host: "mongo2:27017" }, 
            { _id: 2, host: "mongo3:27017" } 
          ] 
        } 
      ) 

### Με την εντολή αυτή επαληθεύουμε την κατάσταση του replica.
-     rs.status()

# Χρήση MongoDB
