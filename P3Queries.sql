-- TABLES --

-- Users: A table containing first name, last name, email, date of birth, hometown, gender, and a hashed password.	

CREATE TABLE Users(
  first_name varchar(20),
  last_name varchar(20),
  email TEXT,
  date_of_birth date,
	hashed_password varchar(25),
	home_town TEXT,
	gender VARCHAR(20),
	User_id INTEGER,
  PRIMARY KEY (user_id)
);

-- Photos: A table containing the image, the caption of the photo, the photo id, and the album id the photo belongs to.

CREATE TABLE Photos (
  photo_id INT,
  caption VARCHAR(255),
  data VARCHAR(255),
  album_id INT,
  user_id INT,
  PRIMARY KEY (photo_id),
  FOREIGN KEY (album_id) references Albums(album_id),
  FOREIGN KEY (user_id) references Users(user_id)
);

-- Albums: Table containing album id, name of the album, owner of the album, and the date of creation.

CREATE TABLE Albums (
  album_id INT PRIMARY KEY,
  name VARCHAR(255),
  owner INT,
  date_of_creation DATE,
  FOREIGN KEY (owner) REFERENCES Users(user_id)
);

-- Likes: Creates a table that consists of the user who did the like on a photo, with that photo having its own id.

CREATE TABLE Likes (
  user_id INT,
  photo_id INT,
  PRIMARY KEY (user_id, photo_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (photo_id) REFERENCES Photos(photo_id)
);

-- Friends: A table that contains user id, friend id, and formation date

CREATE TABLE friend(
	user_id integer,
	friend_id integer,
	Formation_date date,
	PRIMARY KEY(user_id, friend_id),
	FOREIGN KEY (friend_id) REFERENCES Users (user_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- Tags: Creates a table that stores the unique tag id, the photo id that was tagged, user_id for whoever added the tag to the photo, and the tag text. 

CREATE TABLE Tags (
	tag_id INT PRIMARY KEY,
	Photo_id INT,
	user_id INT,
	tag_text VARCHAR(255),
	FOREIGN KEY(photo_id) REFERENCES Photos(photo_id),
  FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

-- Comments: Creates a comments table that has a unique comment id, text in the comment, the user who left the comment, and date the comment was left on.

CREATE TABLE Comments (
	comment_id INT,
	photo_id INT,
	text VARCHAR(255),
	owner INT,
	date_left DATE,
	PRIMARY KEY(comment_id, photo_id),
	FOREIGN KEY(photo_id) REFERENCES Photos(photo_id),
	FOREIGN KEY(owner) REFERENCES Users(user_id)
);


-- QUERIES -- 

-- Adding User:

INSERT INTO Users (user_id,first_name, last_name, email, date_of_birth, hashed_password, home_town, gender)
VALUES
(1,'Alice', 'Snith','alice.smith@example.com', '1995-02-25', '45efwc1ew6c1ew6few',' Columbus', 'female'),
(2,'Bob', 'Johnson', 'b.johnson@example.com', '10/18/1966', '4fde4fd6ed1evbt', 'San_Francisco',' male'),
(3,'Sam','Bohonna','samBoh@example.com','11/07/1955', '21g3tr1trbg456bf', 'Charlotte', 'female'),
(4,'Fred', 'Jinely', 'fredJin@example.com', '05/22/1992', '1yt1brt4btr8b7rb123r', 'Indianapolis', 'male'),
(5,'Hank', 'Davis',' hank.davis@example.com', '07/29/1989',' bgr1bg3t1bt68rg74t98rb1', 'Seattle', 'male'),
(6,'Greg', 'Lee', 'greglee@example.com', '07/30/2004',' bb4r8b4gr6b4grb1g32f1', 'Denver', 'male'),
(7,'Mike',' Hannonson', 'mikHan@example.com', '11/19/1958', 'g45r6b4gtb4g6f4bgf6bgf', 'Washington', 'male'),
(8 ,'Jones', 'Jackson', 'jjack@example.com', '03/03/1981', 'b41fg56bg4f8n7gh5f33', 'Boston', 'male'),
(9,'Sara', 'Lee', 'sarlee@example.com', '03/02/2002', 'bgf4bgfb4g6f1bgf3', 'Nashville', 'female'),
(10,'Hanna', 'Garcia', 'hgarcia@example.com', '07/26/1968', 'b4gf64bgf1bgf32b1gf', 'El_Paso', 'female')

-- User Activity: 
SELECT u.first_name, u.last_name,
    ((SELECT COUNT(*) FROM Comments WHERE owner = u.user_id) + 
    (SELECT COUNT(*) FROM Photos WHERE user_id = u.user_id) + 
    (SELECT COUNT(*) FROM Likes WHERE user_id = u.user_id)) AS score
FROM Users u
ORDER BY score DESC;

-- Insert Photos:
INSERT INTO Photos (photo_id, caption, data, album_id, user_id) 
VALUES 
(1, 'fun times at the beach', 'https://cdn.mos.cms.futurecdn.net/wtqqnkYDYi2ifsWZVW2MT4-1200-80.jpg', 1, 1),
(2, 'brunch', 'https://media.timeout.com/images/105975730/image.jpg', 1, 2),
(3, 'struggling with school', 'https://www.educationquizzes.com/library/Knowledge-Bank/What-can-I-do-if-my-child-is-struggling-at-school.jpg', 1, 2),
(4, 'first day at school', 'https://youthincmag.com/wp-content/uploads/2016/09/first-day-of-college.jpg', 1, 4),
(5, 'I got fired', 'https://assets.entrepreneur.com/content/3x2/2000/20180430215401-GettyImages-644069149.jpeg', 1, 2),
(6, 'new dress', 'https://www.byrdie.com/thmb/-R7ilfjbNP4n0v2dWrO7Mc_FCE8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/sipsip-abdb129dd0044b548110804f49de246f.jpg', 1, 3),
(7, 'Happy Birthday', 'https://cdn.pumpitupparty.com/uploads/2020/08/happy-birthday-candles-picture-id1202880334.jpg', 1, 2),
(8, 'cooked this myself', 'https://hips.hearstapps.com/del.h-cdn.co/assets/18/11/2048x1152/hd-aspect-1520886453-beef-wellington-delish.jpg?resize=1200:*', 1, 5),
(9, 'Just failed my exam', 'https://arc-anglerfish-arc2-prod-gmg.s3.amazonaws.com/public/VZBPH3JWNFGVFGOEYX3V7JIQFU.jpg', 1,6),
(10, 'cool pic', 'https://vinsweb.org/wp-content/uploads/2020/03/AtHome-ice-1080x810-1.jpg', 1,5);

-- Inserting Comments :
INSERT INTO Comments (comment_id, photo_id, text, owner, date_left)
VALUES 
(1, 3, 'This is a great photo!', 4, '2023-01-02'),
(2, 1, 'wow', 6, '2023-02-28'),
(3, 2, 'Call me', 5, '2023-01-03'),
(4, 2, 'Text me back', 5, '2023-02-03'),
(5, 4, 'xoxo', 8, '2023-03-01'),
(6, 7, 'hahahahahhaha', 2, '2023-01-23'),
(7, 3, 'This is a great photo!', 2, '2023-01-01'),
(8, 6, 'that is a beautiful photo', 4, '2023-01-18'),
(9, 2, 'This is a great photo!', 1, '2023-01-01'),
(10, 3, ':P', 3, '2023-01-01');


-- Insert Albums:

INSERT INTO Albums (album_id, name, owner, date_of_creation)
VALUES 
(1, 'Vacation Photos', 2, '2023-02-12'),
(2, 'Meme Vault', 1, '2023-02-15'),
(3, 'Dog Photos', 4, '2023-01-14'),
(4, 'New Years', 4, '2023-01-01'),
(5, 'Christmas', 2, '2022-12-25'),
(6, 'New Years', 1, '2023-01-02'),
(7, 'Christmas', 1, '2022-12-25'),
(8, 'Road Trip', 6, '2023-02-12'),
(9, 'Family Reunion', 4, '2023-02-15'),
(10, 'My First Album', 5, '2023-01-09');


-- Inserting Likes:

INSERT INTO likes (user_id, photo_id) 
VALUES 
(1, 1),
(4, 7),
(2, 4),
(2, 1),
(6, 4),
(1, 3),
(2, 3),
(3, 5),
(3, 1),
(7, 3);


-- Inserting Tags:

INSERT INTO tags (tag_id, photo_id, user_id, tag_text)
VALUES
(1, 1, 1, 'beach'),
(2, 1, 1, 'ocean'),
(3, 2, 3, 'mountain'),
(4, 3, 2, 'moon'),
(5, 4, 4, 'tomato'),
(6, 4, 4, 'garden'),
(7, 5, 1, 'sky'),
(8, 6, 5, 'town'),
(9, 7, 6, 'food'),
(10, 7, 7, 'restaurant'),
(11, 1, 1, 'blue'),
(12, 5, 1, 'blue'),
(13, 3, 2, 'blue');


-- Friends and Adding Friends:

INSERT INTO friend (user_id, friend_id, formation_date)
VALUES
(LEAST(1, 2), GREATEST(1, 2), '2022-01-01'),
(LEAST(1, 5), GREATEST(1, 5), '2020-02-02'),
(LEAST(2, 9), GREATEST(2, 9), '2020-03-03'),
(LEAST(2, 7), GREATEST(2, 7), '2021-04-04'),
(LEAST(2, 8), GREATEST(2, 8), '2002-05-05'),
(LEAST(5, 8), GREATEST(5, 8), '2022-06-05'),
(LEAST(6, 10), GREATEST(6, 10), '2001-06-23'),
(LEAST(7, 1), GREATEST(7, 1), '2002-06-13'),
(LEAST(3, 1), GREATEST(3, 1), '2008-06-02'),
(LEAST(8, 9), GREATEST(8, 9), '2010-06-11');



-- Search Friends:
SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Ariel' AND user.last_name = 'Nora';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Hope' AND user.last_name = 'Green';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Adonis' AND user.last_name = 'King';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Timothy' AND user.last_name = 'Solace';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Nicolas' AND user.last_name = 'Mitchell';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Morgan' AND user.last_name = 'Ashley';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Gracie' AND user.last_name = 'Madison';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Abraham' AND user.last_name = 'Nora';
SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Alexa' AND user.last_name = 'Melenia';

SELECT user.first_name,user.last_name
FROM Users user
WHERE user.first_name = 'Nevaeh' AND user.last_name = 'Flores';

-- List Own Friends:

SELECT *
FROM friend
WHERE User_id = 1234;

SELECT *
FROM friend
WHERE User_id = 5826;

SELECT *
FROM friend
WHERE User_id = 140;


-- Search Mutual Friends:

SELECT f1.friend_id 
FROM friend f1 
JOIN friend f2 ON f1.friend_id = f2.friend_id 
WHERE f1.user_id = A AND f2.user_id = B
UNION
SELECT f1.friend_id 
FROM friend f1 
JOIN friend f2 ON f1.friend_id = f2.user_id 
WHERE f1.user_id = A AND f2.friend_id = B;

-- Where A and B are different users.

-- Search Comments:
SELECT * 
FROM Comments AS c 
WHERE c.text LIKE '%christmas%';

SELECT * 
FROM Comments AS c 
WHERE c.text LIKE '%cool%';

SELECT * 
FROM Comments AS c 
WHERE c.text LIKE '%looking good%';

-- Search Tag:

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Bait';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Left';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Shark';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'What';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'About';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Right';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Dolphins';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Steam';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Christmas';

SELECT tag_text
FROM Tags t
Where t.tag_text = 'Confused';


-- Search Popular tag:

SELECT tag_text, COUNT(*) as count
FROM Tags
JOIN Photos ON Tags.photo_id = Photos.photo_id
GROUP BY tag_text
ORDER BY count DESC
LIMIT 10;

-- Fetch users who liked or commented on a photo:
SELECT DISTINCT user_id
FROM (
  SELECT user_id
  FROM Likes
  WHERE photo_id = A
  UNION
  SELECT owner AS user_id
  FROM Comments
  WHERE photo_id = A
) AS LikesOrComments;

-- Where A is the photo_id of the photo of interest.

-- Recommendations
SELECT p.photo_id, p.caption, p.data, p.album_id, COUNT(t.tag_text) AS Similarities
FROM Photos AS p
JOIN Tags AS t ON p.photo_id = t.photo_id
WHERE t.tag_text = (
  SELECT t.tag_text
  FROM Tags AS t
  WHERE t.user_id = 1
  GROUP BY t.tag_text
  ORDER BY COUNT(t.tag_text) DESC
  LIMIT 5) AND t.user_id != 1
  ORDER BY COUNT(t.tag_text) DESC;

-- Where t.user_id changes depending on the user who is getting the recommendations

-- Search Photos

SELECT p.photo_id, p.caption, p.data, p.album_id
FROM Photos AS p
JOIN Tags AS t ON p.photo_id = t.photo_id
WHERE t.tag_text = "blue";

-- Where tag_text is changed depending on what tag the user is looking for can add AND or OR for more tag descriptions for the search


SELECT tag_text, COUNT(*) as count
FROM tags
JOIN photos ON tags.photo_id = photos.photo_id
GROUP BY tag_text
ORDER BY count DESC
LIMIT 10;


SELECT photos.photo_id, photos.caption, photos.data, photos.album_id, photos.user_id
FROM photos
JOIN tags ON photos.photo_id = tags.photo_id
WHERE (tags.tag_text IN (
        SELECT tag_text
        FROM tags
        JOIN photos ON tags.photo_id = photos.photo_id
        WHERE tags.user_id = 1
        GROUP BY tag_text
        ORDER BY COUNT(*) DESC
    ) OR photos.user_id = 1)
    AND tags.user_id <> 1
    AND photos.user_id <> 1
GROUP BY photos.photo_id
ORDER BY COUNT(*) DESC


        SELECT DISTINCT u.first_name, u.last_name
        FROM users u
        INNER JOIN friend f1 ON u.user_id = f1.user_id
        INNER JOIN friend f2 ON u.user_id = f2.friend_id
        WHERE f1.friend_id = ${loggedInUserID} OR f2.user_id = ${value}