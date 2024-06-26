Στο αρχείο αυτό θα αναφερθούμε αποκλειστικά στις εντολές εγκατάστασης του MongoDB Replica μας. <br/> <br/>

Αφού έχουμε κατεβάσει όλα τα απαραίτητα εργαλεία, τρέχουμε την εντολη <br/> <br/>
**sudo docker-compose up -d** <br/> <br/>
με την οποία δημιουργούμε το image μας και τα container μας. <br/> <br/>

Στην συνέχεια με την εντολή <br/> <br/>
**sudo docker ps** <br/> <br/>
λαμβάνουμε πληροφορίες για τα container μας. Από εδώ θα χρειαστούμε μόνο τα ονόματα. Έτσι, με την εντολή <br/> <br/>
**sudo docker exec -it mongo1 mongo** <br/> <br/>
εισερχόμαστε στο container με όνομα mongo1 και τρέχουμε την εντολή mongo για να συνδεθούμε στην MongoDB. <br/> <br/> 

Αφού δούμε το σημαδάκι ">" τρέχουμε την παρακάτω εντολή για να δημιουργήσουμε το replica μας. <br/> <br/>
rs.initiate( <br/>
&nbsp; &nbsp; { <br/>
&nbsp; &nbsp; &nbsp; &nbsp; _id: "rs0", <br/>
&nbsp; &nbsp; &nbsp; &nbsp;members: [ <br/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { _id: 0, host: "mongo1:27017" }, <br/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { _id: 1, host: "mongo2:27017" }, <br/>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { _id: 2, host: "mongo3:27017" } <br/>
&nbsp; &nbsp; &nbsp; &nbsp;] <br/>
&nbsp; &nbsp; } <br/>
)<br/> <br/>

Επαληθεύουμε την κατάσταση του replica μας με την εντολή <br/> <br/>
**rs.status()** <br/> <br/>
και πατάμε enter. <br/> <br/>

Μπορούμε τώρα να χρησιμοποιήσουμε την MongoDB και αν θελήσουμε να βγούμε από αυτήν τρέχουμε την εντολή <br/> <br/>
**exit** <br/> <br/>
