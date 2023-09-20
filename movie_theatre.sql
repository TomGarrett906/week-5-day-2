---I had TO RENAME EACH chart name beacuse OF duplicate name errors, 
--AND wasn't confident IN delelting previous attempts. 
--For whatever reason I could not get my ER diagram to show up but I'll try to exapling what going on here.
CREATE TABLE the_customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(150)
);
--The customers table stores information about customers, including a unique 
--customer_id, first_name, last_name, and address. 
--This table is the entity of the movie theatre database, 
--and it can connected to the other tables through the foreign key.

CREATE TABLE the_concessions (
    concession_id SERIAL PRIMARY KEY,
    item_id SERIAL,
    total_cost NUMERIC(10, 2),
    payment_info VARCHAR(15),
    customer_id INT REFERENCES the_customers(customer_id)
);
--The concessions table stores concession items purchased by customers. 
--The concession_id as the primary key and includes details like item_id 
--which can reference to the concession item, total_cost is the cost of the concession, 
--payment_info would include payment details, and the customer_id is the foreign key 
--that links each concession item to a specific customer.

CREATE TABLE the_tickets (
    ticket_id SERIAL PRIMARY KEY,
    amount NUMERIC(10, 2),
    seat_number VARCHAR(15),
    quantity INTEGER,
    customer_id INT REFERENCES the_customers(customer_id)
);
--My tickets table is used to hold information about movie tickets purchased by the customers. 
--The ticket_id I have as the primary key and leads to info like amount, and ticket price, 
--My seat_number is the seat assigned to the ticket, quantity is the number of tickets purchased per customer, 
--and a customer_id my foreign key, linking each ticket to the customer who made the purchase.

CREATE TABLE movies_1 (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    rating VARCHAR(10),
    show_time TIMESTAMP
);
--The movies table stores information about movies being shown, including movie_id as the primary key,
--The title is well the title of the movie, rating is the movie's rating, like PG-13, 
--My show_time stores the date and time when the movie is scheduled to be played. 
--For this table I was having trouble thinking of a good foreign key to relate to the other tables, 
--but it likely it could be ticket_id? 