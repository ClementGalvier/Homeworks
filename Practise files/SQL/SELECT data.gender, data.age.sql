SELECT DISTINCT data.gender AS gender, data.age AS age, data.embarked AS embarked, data.name AS name-- will return only unique pairs 
FROM dataset AS data
WHERE age >40 AND (embarked = 'C' OR embarked = 'D') -- same as WHERE age >40 AND (embarked IN('C','D')) || WHERE age != 70 (different from) ||   
GROUP BY embarked
HAVING
ORDER BY  gender, age -- by default by ASC but can specifyc DESC 
LIMIT 10 --  return x amount of rows


-- WILDCARDS 
WHERE name LIKE 'b%' -- LIKE combined with the special character makes it powerful. whateever starts with 'b'
WHERE name LIKE '%b' -- whatever ends with letter 'b'
WHERE name LIKE '%b%' -- whatever contains  letter 'b'

WHERE name LIKE '%_o%' -- whatever has letter 'o' as 2nd character


--------------------------------------

SELECT DISTINCT name, points_game,-- what is contained in your display
FROM bigquery-public-data.ncaa_basketball.mbb_historical_teams_games
WHERE points_game > 163 AND name is not null
ORDER BY points_game DESC
LIMIT 10

----------------
SELECT name,win,points_game -- we dont need to include attendance to filter it
FROM bigquery-public-data.ncaa_basketball.mbb_historical_teams_games
WHERE points_game >150 OR attendance >77612
LIMIT 10

----------------
SELECT games.game_id, mascots.name
FROM bigquery-public-data.ncaa_basketball.mbb_games_sr games -- dont need the "AS"
LEFT JOIN bigquery-public-data.ncaa_basketball.mascots mascots -- dont need the "AS"
ON games.game_id = mascots.id
WHERE mascots.mascot_name LIKE '%h%'
LIMIT 5


-----------
SELECT DISTINCT mascots.name, AVG (games.attendance) AS average_attendance_session
FROM bigquery-public-data.ncaa_basketball.mascots mascots
JOIN bigquery-public-data.ncaa_basketball.mbb_games_sr games
ON mascots.id =  games.h_id

GROUP BY mascots.name
ORDER BY average_attendance_session DESC

--------------

SELECT games.season season, AVG (games.attendance) AS average_attendance_session
FROM bigquery-public-data.ncaa_basketball.mascots mascots
JOIN bigquery-public-data.ncaa_basketball.mbb_games_sr games
ON mascots.id =  games.h_id
WHERE season >2014 -- WHERE comes first for the filter
GROUP BY season -- your pivot table. only works with aggregation ( SUM, COUNT, AVG ...)
HAVING average_attendance_session > 4900 -- only works with GROUP BY
ORDER BY average_attendance_session DESC




