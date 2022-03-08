--1. Query all of the entries in the Genre table
SELECT * FROM Genre

--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT ArtistName 
FROM Artist
ORDER BY ArtistName

--3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT a.ArtistName, s.*
FROM Song AS s
JOIN Artist AS a ON a.Id = s.ArtistId


--4. Write a SELECT query that lists all the Artists that have a Soul Album

SELECT DISTINCT a.*
FROM Artist AS a
JOIN Album AS b ON a.Id = b.ArtistId
JOIN Genre As g ON b.GenreId  = g.Id
WHERE g.Name = 'Soul'

--5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

SELECT DISTINCT a.* FROM Artist AS a
JOIN Album AS b ON a.Id = b.ArtistId
JOIN Genre As g ON b.GenreId  = g.Id
WHERE g.Name = 'Rock' OR g.Name = 'Jazz'

--6. Write a SELECT statement that lists the Albums with no songs

SELECT * FROM Album 
LEFT JOIN Song 
ON Song.AlbumId = Album.Id
WHERE Song.Id is NULL

--7. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Modest Mouse', 1993);

--8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('The Lonesome Crowded West', '11/18/1997', 4438, 'UP', 28, 2);


--9. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Trailer Trash', 349, '11/18/1997', 2, 28, 23);


--10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.ArtistName, s.Title, b.Title FROM Album as b
LEFT JOIN Song as s
ON b.Id = s.AlbumId
LEFT JOIN Artist AS a
ON a.Id = b.ArtistId
WHERE s.Title = 'Trailer Trash'

--11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Album.Title, COUNT(Song.Id) AS 'Number of Songs'
FROM Album
LEFT JOIN Song ON Song.AlbumId = Album.Id
GROUP BY  Album.Id, Album.Title

--12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Artist.ArtistName, COUNT(Song.Id) AS 'Number of Songs'
FROM Song 
JOIN Artist ON Song.ArtistId = Artist.Id
GROUP BY Artist.Id, Artist.ArtistName

--13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Genre.Name, COUNT(Song.Id) AS 'Number of Songs'
FROM Song
JOIN Genre ON Song.GenreId = Genre.Id
Group by Genre.Id, Genre.Name

--14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT Artist.ArtistName
FROM Artist
JOIN Album ON  Album.ArtistId = Artist.Id
GROUP BY Artist.Id, Artist.ArtistName
HAVING COUNT(Distinct Album.Label) > 1

--15. Using ORDER BY and TOP 1, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT TOP 1 Album.Title 'Song', Album.AlbumLength 'Duration'
FROM Album
ORDER BY Album.AlbumLength DESC

--16. Using ORDER BY and TOP 1, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT TOP 1 Song.Title 'Song', Song.SongLength 'Duration'
FROM Song
ORDER BY Song.SongLength DESC

--17. Modify the previous query to also display the title of the album.
SELECT TOP 1 Song.Title 'Song', Song.SongLength 'Duration', Album.Title 'Album Title'
FROM Song
JOIN Album ON Song.AlbumId = Album.Id
ORDER BY Song.SongLength DESC