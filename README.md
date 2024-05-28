# Cloud Computing Mongo Replica
Η εργασία αυτή ασχολείται με την δημουργία ενός MongoDB instance(container) μέσω Docker. Η συγκεκριμένη βάση δεδομένων έχει ήδη έτοιμο pre-built image, επομένως δεν είναι απαραίτητο να χρησιμοποιηθεί Dockerfile (Docker), αλλά θα υλοποιηθεί με yaml αρχείο μόνο (Docker-compose).  

# Προετοιμασία χρήστη

Στο σημείο αυτό, ο χρήστης (εαν το επιθυμεί) μπορεί να τρέξει το script με όνομα prepare.sh. Αυτό, κάνει ενημέρωση όλων των repositories και εγκαθιστά το docker και το docker-compose που είναι απαραίτητα για την υλοποίηση της βάσης δεδομένων.
Αρχικά, στον κατάλογο που επιθυμεί κατεβάζει όλα τα αρχεία με την εντολή:
-     git clone https://github.com/AchilleasTsiamoulis/CloudComputingMongo.git
Μετακινούμαστε στον φάκελο μας.
-     cd CloudComputingMongo
Έπειτα πρέπει να αλλάξει-προσθέσει δικαίωμα εκτέλεσης στο αρχείο με την εντολή:
-     chmod +x prepare.sh
Έπειτα μπορεί να τρέξει το script με την εντολή:
-     ./prepare.sh


# Υλοποίηση MongoDB  
### Δημιουργούμε το MongoDB image και τα containers. <br />
-     docker-compose up -d

### Με την εντολή αυτή βλέπουμε όλα τα images του docker. <br />
-     docker images

### Με την εντολή αυτή βλέπουμε πληροφορίες του image και όλα τα ενεργά containers. <br />
-     docker ps 

### Με την εντολή αυτή χρησιμοποιούμε το πρώτο container (mongo1) για να τρέξουμε την εντολή mongo και να εισέρθουμε στην βάση MongoDB. <br />
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
Εφόσον το επιθυμεί ο χρήστης μπορεί να χρησιμοποιήσει την βάση με κάποιες απο τις παρακάτω εντολές.

### Εναλλαγή σε μία βάση.
-     use <database name>
### Δημιουργία συλλογής.
-     db.createCollection("collection_name")
### Εισαγωγή στοιχείου.
-     db.collection_name.insert({ key: "value", key2: "value2" })
### Εύρεση ενός στοιχείου.
-     db.collection_name.find(key: "value")
### Ενημέρωση ενός στοιχείου.
-     db.collection_name.update(
          { key: "value" },          
          { $set: { key2: "new_value" } }  
      )
### Διαγραφή ενός στοιχείου.
-     db.collection_name.remove({ key: "value" })
### Διαγραφή συλλογής.
-     db.collection_name.drop()
### Διαγραφή βάσης δεδομένων.
-     db.dropDatabase()


# Διαγραφή containers και images
### Για να διαγράψουμε τα containers τρέχουμε την εντολή docker ps, όπως παραπάνω και στην συνέχεια:
-     docker stop <container id ή name> && docker rm <container id>
### Μπορούμε επίσης να σβήσουμε τα containers και τα networks με την εντολή:
-     docker-compose down
### Για να διαγράψουμε τα images τρέχουμε την εντολή docker images, όπως παραπάνω και στην συνέχεια:
-     docker rmi <image id> --force 
### Πλήρης αφαίρεση όλων των images, των containers, των volumes και των networks:
-     docker system prune -a 

















