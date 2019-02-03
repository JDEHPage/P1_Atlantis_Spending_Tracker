DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;


CREATE TABLE merchants(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE tags(
  id SERIAL8 primary key,
  -- tags_link_id INT8 references tags_links(id),
  name VARCHAR(255) not null
);


CREATE TABLE transactions(
  id SERIAL8 primary key,
  merchant_id INT8 REFERENCES merchants(id),
  transaction_date DATE,
  value INT,
  tag_id INT8 REFERENCES tags(id)
);



-- CREATE TABLE transactions(
--   id SERIAL8 primary key,
--   merchant_id INT8 DEFAULT NULL REFERENCES merchants(id) ON DELETE SET NULL,
--   transaction_date DATE,
--   value INT,
--   tag_id INT8 DEFAULT NULL REFERENCES tags(id) ON DELETE SET NULL
-- );

-- ALTER TABLE transactions DROP CONSTRAINT FK_tag_id;
-- ALTER TABLE merchants DROP CONSTRAINT name;
-- ALTER TABLE <TABLE_NAME> DROP CONSTRAINT <FOREIGN_KEY_NAME>

-- CREATE TABLE tags_links(
--   id SERIAL8 primary key,
--   transaction_id INT8 references transactions(id),
--   tag_id INT8 references tags(id)
-- );
