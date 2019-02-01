DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;


CREATE TABLE merchants(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE tags(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE transactions(
  id SERIAL8 primary key,
  merchant_id INT8 references merchants(id),
  transaction_date DATE,
  value INT,
  tag_id INT8 references tags(id)
);
