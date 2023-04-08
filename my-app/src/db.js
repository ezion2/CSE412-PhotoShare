const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('./database.sqlite');

db.serialize(() => {
    db.run(`CREATE TABLE IF NOT EXISTS Users (
      first_name varchar(20),
      last_name varchar(20),
      email TEXT,
      date_of_birth date,
      hashed_password varchar(25),
      home_town TEXT,
      gender VARCHAR(20),
      User_id INTEGER,
      PRIMARY KEY (user_id)
    )`);
});

module.exports = db;