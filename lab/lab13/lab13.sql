.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students
    WHERE color='blue' AND pet='dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students
    WHERE color='blue' AND pet='dog';


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color
    FROM students as a, students as b
      WHERE a.pet=b.pet AND a.song=b.song AND a.time<b.time;


CREATE TABLE sevens AS
  SELECT seven
    FROM students as a, numbers as b
      WHERE a.number=7 AND b.'7'='True' AND a.time=b.time;


CREATE TABLE favpets AS
  SELECT pet, count(*) as total
    FROM students
      GROUP BY pet
        ORDER BY total DESC LIMIT 10;


CREATE TABLE dog AS
  SELECT pet, count(*)
    FROM students
      WHERE pet='dog';


CREATE TABLE bluedog_agg AS
  SELECT song, count(*)
    FROM bluedog_songs
      GROUP BY song
        ORDER BY count(*);


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, count(*)
    FROM students
      WHERE seven='7'
        GROUP BY instructor;

