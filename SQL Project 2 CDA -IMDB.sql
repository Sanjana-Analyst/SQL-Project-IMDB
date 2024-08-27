
# Project 2 SQL -IMDB Movies

show databases;
use project_movie_database;
select database();

show tables;

# a) Can you get all data about movies
select * from movies;

# b) how do you get all data about directors
select * from directors;

# c) check how many movies are present in IMDB
SELECT COUNT(*) AS movie_count FROM movies;

# d) find these three directors: james Cameron,Luc Besson,John Woo
select * from directors where name in('James cameron','Luc Besson','John Woo');

# e) Find all directors name starting with Steven
select * from directors where name like ('Steven%');

# f) count female directors
select * from directors where gender=1;

# or 
select count(*) as female_director_count from directors where gender=1;

# G) find the name of first 10th women directors
select * from directors where gender=1 order by name asc limit 1 offset 9;

# H) what are three most popular movies
select * from movies order by popularity desc limit 3;
#or 
select title as most_popular_movie from movies order by popularity desc limit 3;

# I) what are three most bankable movies
select title as most_bankable_movies from movies order by revenue desc limit 3;
#or
select * from movies order by revenue desc limit 3;

# J) What is the most awarded average vote since January 1st, 2000?
select vote_average,title,release_date as most_awarded_avg_vote from movies where release_date >=2000-01-01 order by vote_average desc limit 1;

# K) Which movie(s) were directed by Brenda Chapman?
select * from movies where director_id in (select id from directors where name ='Brenda Chapman');

# or
select m.* from movies m
join directors d on m.director_id=d.id
where d.name ='Brenda Chapman';

# L) Which director made the most movies?
SELECT d.name, COUNT(m.id) AS NumberOfMovies
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.name
ORDER BY NumberOfMovies desc
LIMIT 3;

# M) Whose director is the most bankable?
SELECT d.name, SUM(m.revenue) AS TotalRevenue
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.name
ORDER BY TotalRevenue DESC
LIMIT 1;