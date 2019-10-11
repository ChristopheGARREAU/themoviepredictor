import mysql.connector

print ('Hello World')

cnx = mysql.connector.connect(user='predictor', password='predictor',
                              host='127.0.0.1', #local host
                              database='predictor')
cursor = cnx.cursor()

query = ("SELECT id, title, release_date FROM movies")

cursor.execute(query)

for (id, title, release_date) in cursor:
    print("({}) {} was release on {}"    # Chaque champ est copié {} et est affiché dans l'ordre du .format
    .format(id, title, release_date))

# insertion nouveau people
# création ajout people dans table people
add_people = ("INSERT INTO people "
               "(first_name, last_name) "
               "VALUES (%s, %s)")
# création données nouveau people
data_people = ('Alain', 'DELON')

# Insert new people
cursor.execute(add_people, data_people)

# déplacement incrément id people
people_id = cursor.lastrowid

# mettre dans la database
cnx.commit()

# fermeture de l'outils cursor
cursor.close()

#fermeture connexion
cnx.close()