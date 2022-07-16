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





