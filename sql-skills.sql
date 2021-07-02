-- Artist Table¶
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)

INSERT INTO artist (name)
VALUES ('1974 A.D.'),
	   ('Albatross'),
       ('Bro-Sis');

-- Select 5 artists in alphabetical order.

SELECT * FROM artist
ORDER BY name LIMIT 5;

-- Employee Table
-- List all employee first and last names only that live in Calgary.

SELECT first_name, last_name, FROM employee
WHERE city = 'Calgary';

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards

SELECT * FROM employee 
WHERE reports_to = 2;

-- Count how many people live in Lethbridge.

SELECT COUNT (*) FROM employee
WHERE city = 'Lethbridge';

-- Count how many orders were made from the USA.

SELECT COUNT(*) FROM invoice 
WHERE billing_country = 'USA';

-- Find the largest order total amount.
SELECT MAX(total) FROM invoice;


-- Find the smallest order total amount.
SELECT MIN(total) FROM invoice;

-- Find all orders bigger than $5.
select * from invoice_line
where unit_price > 5;
-- Count how many orders were smaller than $5.
select count(*) from invoice_line
where unit_price < 5; 

-- Get the total sum of the orders
SELECT SUM(total) FROM invoice;

-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT * FROM invoice
JOIN invoice_line
ON invoice_line.invoice_id = invoice.invoice_id
WHERE unit_price > 0.99;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT customer.first_name, customer.last_name, invoice.invoice_date, invoice.total FROM invoice
JOIN customer 
ON invoice.customer_id = customer.customer_id;

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.

SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name FROM customer
JOIN employee 
ON customer.support_rep_id = employee.employee_id;

-- Get the album title and the artist name from all albums.
SELECT album.title, artist.name from album
JOIN artist
ON album.artist_id = artist.artist_id;





-- -----------------------------------EXTRA CREDIT- -----------------------------------
-- Select 10 artists in reverse alphabetical order.

select * from artist 
order by name desc limit 10;

-- Select all artists that start with the word ‘Black’.
select * from artist 
where name LIKE 'Black%';
-- Select all artists that contain the word ‘Black’.

select * from artist 
where name LIKE '%Black%';

-- Find the birthdate for the youngest employee.
select min(birth_date) from employee;
-- Find the birthdate for the oldest employee.
select max(birth_date) from employee;

-- Count how many orders were in CA, TX, or AZ (use IN).

select count(*) from invoice 
where billing_state IN ('CA', 'TX', 'AZ');

-- Get the average total of the orders.
select avg(total) from invoice;

-- Get all playlist_track track_ids where the playlist name is Music.

select playlist_track.track_id from playlist_track
Join playlist
On playlist_track.playlist_id = playlist.playlist_id
where playlist.name = 'Music';

-- Get all track names for playlist_id 5.

SELECT track.name, playlist_track.playlist_id 
FROM track 
JOIN playlist_track
ON track.track_id = playlist_track.track_id
WHERE playlist_id = 5;

-- Get all track names and the playlist name that they’re on ( 2 joins ).

select track.name from track 
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id;

-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).

SELECT track.name, album.title, genre.name
FROM track
JOIN album ON track.album_id = album.album_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Alternative & Punk';