import _sqlite3

connection = _sqlite3.connect('database.db')

res = cursor.execute('SELECT * FROM movies')
print(result.fetchall())