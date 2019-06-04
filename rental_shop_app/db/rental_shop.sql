DROP TABLE rentals;
DROP TABLE games;
DROP TABLE customers;

CREATE TABLE games(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  console VARCHAR(255),
  genre VARCHAR(255),
  quantity INT4,
  image VARCHAR(255)
);

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE rentals(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  game_id INT4 REFERENCES games(id) ON DELETE CASCADE,
  rental_period INT4,
  rental_status VARCHAR(255),
  date_rented DATE
);
