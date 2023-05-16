import requests
from bs4 import BeautifulSoup
import sqlite3

html = requests.get("https://www.imdb.com/search/title/?groups=top_100").text
parsed_html = BeautifulSoup(html, "lxml")

movie_names = parsed_html.find_all("h3", class_="lister-item-header")

movies = []

for movie in movie_names:
    title = movie.find("a").text
    year = movie.find("span", class_="lister-item-year text-muted unbold").text
    movies.append((title, year))

# Create a connection to the SQLite database
conn = sqlite3.connect("movies.db")
cursor = conn.cursor()

# Create a table to store the movie data
cursor.execute("CREATE TABLE IF NOT EXISTS movies (title TEXT, year TEXT)")

# Insert the movie data into the table
cursor.executemany("INSERT INTO movies VALUES (?, ?)", movies)

# Commit the changes and close the connection
conn.commit()
conn.close()
