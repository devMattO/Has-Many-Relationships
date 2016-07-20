\i has_many_blogs.sql
\i scripts/blog_data.sql

----
SELECT *
FROM users;

--1--
SELECT *
FROM posts
WHERE id = 100;

--2--
SELECT *
FROM posts
WHERE user_id = 200;

--3--
SELECT
  posts.*,
  users.first_name,
  users.last_name
FROM posts
INNER JOIN users ON posts.user_id = 200;

--4--
SELECT
  posts.*,
  users.username
FROM posts
INNER JOIN users ON users.first_name = 'Norene'
AND users.last_name = 'Schmitt';

--5--
SELECT username
FROM users
WHERE created_at > '2015-1-1';

--6--
SELECT
  posts.title,
  posts.content,
  users.username,
  users.created_at
FROM posts
INNER JOIN users ON posts.user_id = users.id
WHERE users.created_at < '2015-01-01';

--7--
SELECT
  *,
  posts.title AS "Post Title"
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id;
--HOW DO WE KNOW THESE THINGS WORK

--8--
SELECT
  *,
  posts.title AS "post_title",
  posts.url AS "post_url",
  comments.body AS "comment_body"
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id
WHERE posts.created_at  < '2015-01-01';

--9--
SELECT
  *,
  posts.title AS "post_title",
  posts.url AS "post_url",
  comments.body AS "comment_body"
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id
WHERE posts.created_at  > '2015-01-01';

--10--
SELECT
  *,
  posts.title AS "post_title",
  posts.url AS "post_url",
  comments.body AS "comment_body"
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id
WHERE comments.body LIKE '%USB%';

--11--
SELECT
  posts.title AS "post_title",
  comments.body AS "comment_body",
  users.first_name,
  users.last_name
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id
INNER JOIN users ON users.id = comments.user_id
WHERE comments.body LIKE '%matrix%';

--12--
SELECT
  users.first_name,
  users.last_name,
  comments.body AS "comment_body"
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id
INNER JOIN users ON users.id = comments.user_id
WHERE comments.body LIKE '%SSL%'
AND posts.content LIKE '%dolorum%';

--13--
SELECT
  users.first_name AS "post_author_first_name",
  users.last_name AS "post_author_last_name",
  posts.title AS "post_title",
  users.username AS "comment_author_username",
  comments.body AS "comment_body"
FROM comments
INNER JOIN posts ON posts.id = comments.posts_id
INNER JOIN users ON users.id = comments.user_id
WHERE posts.content LIKE '%nemo%'
AND(comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%');

