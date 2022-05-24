/*Query 3- Top 10 rock song writers*/
SELECT
  a.ArtistId,
  a.Name,
  COUNT(t.TrackId)
FROM Artist a
JOIN Album al
  ON a.ArtistId = al.ArtistId
JOIN Track t
  ON t.AlbumId = al.AlbumId
JOIN Genre g
  ON g.GenreId = t.GenreId
  AND g.Name = "Rock"
GROUP BY 1,
         2
ORDER BY 3 DESC
LIMIT 10;
