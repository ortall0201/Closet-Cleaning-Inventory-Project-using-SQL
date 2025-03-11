mysql> CREATE DATABASE shirts_db;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| cat_shop           |
| chicken_coop       |
| information_schema |
| mysql              |
| performance_schema |
| pet_shop           |
| sakila             |
| shirts_db          |
| slimestore         |
| sys                |
| tweets             |
| world              |
+--------------------+
12 rows in set (0.00 sec)

mysql> USE shirts_db;
Database changed
mysql> SELECT database();
+------------+
| database() |
+------------+
| shirts_db  |
+------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE shirts;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> CREATE TABLE shirts (shirt_id INT AUTO_INCREMENT PRIMARY KEY,
    -> article VARCHAR(50) NOT NULL,
    -> color VARCHAR(50) NOT NULL,
    -> shirt_size VARCHAR(10) NOT NULL DEFAULT 'one size',
    -> last_worn INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> DESC shirts;
+------------+-------------+------+-----+----------+----------------+
| Field      | Type        | Null | Key | Default  | Extra          |
+------------+-------------+------+-----+----------+----------------+
| shirt_id   | int         | NO   | PRI | NULL     | auto_increment |
| article    | varchar(50) | NO   |     | NULL     |                |
| color      | varchar(50) | NO   |     | NULL     |                |
| shirt_size | varchar(10) | NO   |     | one size |                |
| last_worn  | int         | YES  |     | NULL     |                |
+------------+-------------+------+-----+----------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM shirts;
Empty set (0.00 sec)

mysql> INSERT INTO (shirt_id, article, color, shirt_size, last_worn)
    -> VALUES
    -> ('t-shirt', 'white', 'S', 10),
    -> ('t-shirt', 'green', 'S', 200),
    -> ('polo shirt', 'black', 'M', 10),
    -> ('tank top', 'blue', 'S', 50),
    -> ('t-shirt', 'pink', 'S', 0),
    -> ('polo shirt', 'red', 'M', 5),
    -> ('tank top', 'white', 'S', 200),
    -> ('tank top', 'blue', 'M', 15);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(shirt_id, article, color, shirt_size, last_worn)
VALUES
('t-shirt', 'white', 'S' at line 1
mysql> INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
    -> VALUES
    -> ('t-shirt', 'white', 'S', 10),
    -> ('t-shirt', 'green', 'S', 200),
    -> ('polo shirt', 'black', 'M', 10),
    -> ('tank top', 'blue', 'S', 50),
    -> ('t-shirt', 'pink', 'S', 0),
    -> ('polo shirt', 'red', 'M', 5),
    -> ('tank top', 'white', 'S', 200),
    -> ('tank top', 'blue', 'M', 15);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> DESC shirts;
+------------+-------------+------+-----+----------+----------------+
| Field      | Type        | Null | Key | Default  | Extra          |
+------------+-------------+------+-----+----------+----------------+
| shirt_id   | int         | NO   | PRI | NULL     | auto_increment |
| article    | varchar(50) | NO   |     | NULL     |                |
| color      | varchar(50) | NO   |     | NULL     |                |
| shirt_size | varchar(10) | NO   |     | one size |                |
| last_worn  | int         | YES  |     | NULL     |                |
+------------+-------------+------+-----+----------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM shirts;
Empty set (0.00 sec)

mysql> INSERT INTO shirts (article, color, shirt_size, last_worn)
    -> VALUES
    -> ('t-shirt', 'white', 'S', 10),
    -> ('t-shirt', 'green', 'S', 200),
    -> ('polo shirt', 'black', 'M', 10),
    -> ('tank top', 'blue', 'S', 50),
    -> ('t-shirt', 'pink', 'S', 0),
    -> ('polo shirt', 'red', 'M', 5),
    -> ('tank top', 'white', 'S', 200),
    -> ('tank top', 'blue', 'M', 15);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM shirts;
+----------+------------+-------+------------+-----------+
| shirt_id | article    | color | shirt_size | last_worn |
+----------+------------+-------+------------+-----------+
|        1 | t-shirt    | white | S          |        10 |
|        2 | t-shirt    | green | S          |       200 |
|        3 | polo shirt | black | M          |        10 |
|        4 | tank top   | blue  | S          |        50 |
|        5 | t-shirt    | pink  | S          |         0 |
|        6 | polo shirt | red   | M          |         5 |
|        7 | tank top   | white | S          |       200 |
|        8 | tank top   | blue  | M          |        15 |
+----------+------------+-------+------------+-----------+
8 rows in set (0.00 sec)

mysql> INSERT INTO shirts (color, article, shirt_size, last_worn)
    -> VALUES ('Purple', 'polo shirt', 'M', 50);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM shirts;
+----------+------------+--------+------------+-----------+
| shirt_id | article    | color  | shirt_size | last_worn |
+----------+------------+--------+------------+-----------+
|        1 | t-shirt    | white  | S          |        10 |
|        2 | t-shirt    | green  | S          |       200 |
|        3 | polo shirt | black  | M          |        10 |
|        4 | tank top   | blue   | S          |        50 |
|        5 | t-shirt    | pink   | S          |         0 |
|        6 | polo shirt | red    | M          |         5 |
|        7 | tank top   | white  | S          |       200 |
|        8 | tank top   | blue   | M          |        15 |
|        9 | polo shirt | Purple | M          |        50 |
+----------+------------+--------+------------+-----------+
9 rows in set (0.00 sec)

mysql> SELECT article, color FROM shirts;
+------------+--------+
| article    | color  |
+------------+--------+
| t-shirt    | white  |
| t-shirt    | green  |
| polo shirt | black  |
| tank top   | blue   |
| t-shirt    | pink   |
| polo shirt | red    |
| tank top   | white  |
| tank top   | blue   |
| polo shirt | Purple |
+------------+--------+
9 rows in set (0.00 sec)

mysql> SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';
+------------+--------+------------+-----------+
| article    | color  | shirt_size | last_worn |
+------------+--------+------------+-----------+
| polo shirt | black  | M          |        10 |
| polo shirt | red    | M          |         5 |
| tank top   | blue   | M          |        15 |
| polo shirt | Purple | M          |        50 |
+------------+--------+------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT article FROM shirts WHERE aticle='polo shirt';
ERROR 1054 (42S22): Unknown column 'aticle' in 'where clause'
mysql> SELECT article FROM shirts WHERE article='polo shirt';
+------------+
| article    |
+------------+
| polo shirt |
| polo shirt |
| polo shirt |
+------------+
3 rows in set (0.00 sec)

mysql> SELECT article, shirt_size FROM shirts WHERE aticle='polo shirt';
ERROR 1054 (42S22): Unknown column 'aticle' in 'where clause'
mysql> SELECT article, shirt_size FROM shirts WHERE  article='polo shirt';
+------------+------------+
| article    | shirt_size |
+------------+------------+
| polo shirt | M          |
| polo shirt | M          |
| polo shirt | M          |
+------------+------------+
3 rows in set (0.00 sec)

mysql> UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> SELECT article, shirt_size FROM shirts WHERE  article='polo shirt';
+------------+------------+
| article    | shirt_size |
+------------+------------+
| polo shirt | L          |
| polo shirt | L          |
| polo shirt | L          |
+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM shirts WEHRE last_worn=15;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'last_worn=15' at line 1
mysql> DESC shirts;
+------------+-------------+------+-----+----------+----------------+
| Field      | Type        | Null | Key | Default  | Extra          |
+------------+-------------+------+-----+----------+----------------+
| shirt_id   | int         | NO   | PRI | NULL     | auto_increment |
| article    | varchar(50) | NO   |     | NULL     |                |
| color      | varchar(50) | NO   |     | NULL     |                |
| shirt_size | varchar(10) | NO   |     | one size |                |
| last_worn  | int         | YES  |     | NULL     |                |
+------------+-------------+------+-----+----------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT article FROM shirts WHERE last_worn=15;
+----------+
| article  |
+----------+
| tank top |
+----------+
1 row in set (0.00 sec)

mysql> UPDATE shirts SET last_worn=0 WHERE last_worn=15;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT article FROM shirts WHERE last_worn=15;
Empty set (0.00 sec)

mysql> SELECT * FROM shirts;
+----------+------------+--------+------------+-----------+
| shirt_id | article    | color  | shirt_size | last_worn |
+----------+------------+--------+------------+-----------+
|        1 | t-shirt    | white  | S          |        10 |
|        2 | t-shirt    | green  | S          |       200 |
|        3 | polo shirt | black  | L          |        10 |
|        4 | tank top   | blue   | S          |        50 |
|        5 | t-shirt    | pink   | S          |         0 |
|        6 | polo shirt | red    | L          |         5 |
|        7 | tank top   | white  | S          |       200 |
|        8 | tank top   | blue   | M          |         0 |
|        9 | polo shirt | Purple | L          |        50 |
+----------+------------+--------+------------+-----------+
9 rows in set (0.00 sec)

mysql> SELECT article FROM shirts WHERE last_worn=0;
+----------+
| article  |
+----------+
| t-shirt  |
| tank top |
+----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM shirts WHERE color='white';
+----------+----------+-------+------------+-----------+
| shirt_id | article  | color | shirt_size | last_worn |
+----------+----------+-------+------------+-----------+
|        1 | t-shirt  | white | S          |        10 |
|        7 | tank top | white | S          |       200 |
+----------+----------+-------+------------+-----------+
2 rows in set (0.00 sec)

mysql> UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM shirts WHERE color='white';
Empty set (0.00 sec)

mysql> SELECT * FROM shirts WHERE color='off white';
+----------+----------+-----------+------------+-----------+
| shirt_id | article  | color     | shirt_size | last_worn |
+----------+----------+-----------+------------+-----------+
|        1 | t-shirt  | off white | XS         |        10 |
|        7 | tank top | off white | XS         |       200 |
+----------+----------+-----------+------------+-----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM shirts WHERE last_worn=200;
+----------+----------+-----------+------------+-----------+
| shirt_id | article  | color     | shirt_size | last_worn |
+----------+----------+-----------+------------+-----------+
|        2 | t-shirt  | green     | S          |       200 |
|        7 | tank top | off white | XS         |       200 |
+----------+----------+-----------+------------+-----------+
2 rows in set (0.00 sec)

mysql> DELETE FROM shirts WHERE last_worn=200;
Query OK, 2 rows affected (0.01 sec)

mysql> SELECT * FROM shirts WHERE last_worn=200;
Empty set (0.00 sec)

mysql> SELECT * FROM shirts;
+----------+------------+-----------+------------+-----------+
| shirt_id | article    | color     | shirt_size | last_worn |
+----------+------------+-----------+------------+-----------+
|        1 | t-shirt    | off white | XS         |        10 |
|        3 | polo shirt | black     | L          |        10 |
|        4 | tank top   | blue      | S          |        50 |
|        5 | t-shirt    | pink      | S          |         0 |
|        6 | polo shirt | red       | L          |         5 |
|        8 | tank top   | blue      | M          |         0 |
|        9 | polo shirt | Purple    | L          |        50 |
+----------+------------+-----------+------------+-----------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM shirts WHERE article='tank top';
+----------+----------+-------+------------+-----------+
| shirt_id | article  | color | shirt_size | last_worn |
+----------+----------+-------+------------+-----------+
|        4 | tank top | blue  | S          |        50 |
|        8 | tank top | blue  | M          |         0 |
+----------+----------+-------+------------+-----------+
2 rows in set (0.00 sec)

mysql> DELETE FROM shirts WHERE article='tank top';
Query OK, 2 rows affected (0.01 sec)

mysql> SELECT * FROM shirts;
+----------+------------+-----------+------------+-----------+
| shirt_id | article    | color     | shirt_size | last_worn |
+----------+------------+-----------+------------+-----------+
|        1 | t-shirt    | off white | XS         |        10 |
|        3 | polo shirt | black     | L          |        10 |
|        5 | t-shirt    | pink      | S          |         0 |
|        6 | polo shirt | red       | L          |         5 |
|        9 | polo shirt | Purple    | L          |        50 |
+----------+------------+-----------+------------+-----------+
5 rows in set (0.00 sec)

mysql> DELETE FROM shirts;
Query OK, 5 rows affected (0.01 sec)

mysql> SELECT * FROM shirts;
Empty set (0.00 sec)

mysql> DESC shirts;
+------------+-------------+------+-----+----------+----------------+
| Field      | Type        | Null | Key | Default  | Extra          |
+------------+-------------+------+-----+----------+----------------+
| shirt_id   | int         | NO   | PRI | NULL     | auto_increment |
| article    | varchar(50) | NO   |     | NULL     |                |
| color      | varchar(50) | NO   |     | NULL     |                |
| shirt_size | varchar(10) | NO   |     | one size |                |
| last_worn  | int         | YES  |     | NULL     |                |
+------------+-------------+------+-----+----------+----------------+
5 rows in set (0.00 sec)

mysql> DROP TABLE shirts;
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW TABLES;
Empty set (0.00 sec)

mysql> SELECT database();
+------------+
| database() |
+------------+
| shirts_db  |
+------------+
1 row in set (0.00 sec)

mysql>
