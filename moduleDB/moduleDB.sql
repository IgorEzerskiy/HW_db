--task 1
CREATE TABLE people (id INT, names VARCHAR(50), pwd VARCHAR(50), email VARCHAR(256), gender VARCHAR(1));

INSERT INTO people (id, names, pwd, email, gender) VALUES (1, 'Vasya', '21341243qwfsdf', 'mmm@mmail.com', 'm'), (2, 'Alex', '21341234', 'mmm@gmail.com', 'm'), (3, 'Alexey', 'qq21341234Q', 'alexey@gmail.com', 'm'), (4, 'Helen', 'MarryMeeee', 'hell@gmail.com', 'f'), (5, 'Jenny', 'SmakeMyb', 'eachup@gmail.com', 'f'), (6, 'Lora', 'burn23', 'tpicks@gmail.com', 'f');
/*
 id | names  |      pwd       |      email       | gender
----+--------+----------------+------------------+--------
  1 | Vasya  | 21341243qwfsdf | mmm@mmail.com    | m
  2 | Alex   | 21341234       | mmm@gmail.com    | m
  3 | Alexey | qq21341234Q    | alexey@gmail.com | m
  4 | Helen  | MarryMeeee     | hell@gmail.com   | f
  5 | Jenny  | SmakeMyb       | eachup@gmail.com | f
  6 | Lora   | burn23         | tpicks@gmail.com | f
*/

--task 2
SELECT 'This is' || ' ' ||  names  || ',' || CASE WHEN gender ='m' THEN ' he has email' ELSE ' she has email' END  || ' ' || email AS "INORMATION" FROM people;

/*
                  INORMATION
-----------------------------------------------
 This is Vasya, he has email mmm@mmail.com
 This is Alex, he has email mmm@gmail.com
 This is Alexey, he has email alexey@gmail.com
 This is Helen, she has email hell@gmail.com
 This is Jenny, she has email eachup@gmail.com
 This is Lora, she has email tpicks@gmail.com
*/

--task 3
SELECT 'We have' || ' ' || COUNT(gender) || ' ' || CASE WHEN gender = 'm' THEN 'boys' ELSE 'girls!' END AS "GENDER INFORMATION" FROM people GROUP BY gender;
/*
 GENDER INFORMATION
--------------------
 We have 3 boys
 We have 3 girls!
*/

--task 4
CREATE TABLE word (id SERIAL, word VARCHAR(255), vocabulary_id INTEGER);

CREATE TABLE vocabulary (id SERIAL, names VARCHAR(255), info TEXT);

INSERT INTO vocabulary (names) VALUES ('animals'), ('school'), ('nature'), ('human'), ('SF');

INSERT INTO word (word, vocabulary_id) VALUES ('turtle', 1), ('pig', 1), ('dog', 1), ('cat', 1), ('lizard', 1), ('cow', 1), ('rabbit', 1), ('frog', 1), ('headgehog', 1), ('goat', 1);

INSERT INTO word (word, vocabulary_id) VALUES ('desk', 2), ('book', 2), ('chalk', 2), ('pen', 2), ('pencil', 2), ('copybook', 2), ('lesson', 2), ('teacher', 2), ('pupils', 2), ('school', 2);

INSERT INTO word (word, vocabulary_id) VALUES ('ray', 3), ('thunder', 3), ('sun', 3), ('field', 3), ('hill', 3), ('mountain', 3), ('river', 3), ('forest', 3), ('grass', 3), ('rain', 3);

INSERT INTO word (word, vocabulary_id) VALUES ('hair', 4), ('nail', 4), ('finger', 4), ('eye', 4), ('tooth', 4), ('knee', 4), ('elbow', 4), ('leg', 4), ('arm', 4), ('head', 4);

INSERT INTO word (word, vocabulary_id) VALUES ('engine', 5), ('steel', 5), ('power', 5), ('nuclear', 5), ('shotgun', 5), ('laser', 5), ('flight', 5), ('energy', 5), ('Moon', 5), ('splace', 5);

--task 5
SELECT vocabulary.names, count(word.vocabulary_id) AS " words" FROM word INNER JOIN vocabulary ON (vocabulary.id = word.vocabulary_id) GROUP BY vocabulary.names ORDER BY vocabulary.names;
/*
  names  |  words
---------+--------
 animals |     10
 human   |     10
 nature  |     10
 school  |     10
 SF      |     10
*/