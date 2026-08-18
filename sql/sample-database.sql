-- Need to create some sort of sample database.
-- Creating a Bookstore as per this guide:
-- https://blog.panoply.io/database-schema-design-examples

-- Genres
CREATE TABLE bookstore.genres
    (
        id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
        name character varying(255) NOT NULL,
        description character varying(255) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE (name)
    );

ALTER TABLE IF EXISTS bookstore.genres
    OWNER TO postgres;


-- Authors
CREATE TABLE bookstore.authors
    (
        id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
        name character varying(255) NOT NULL,
        bio character varying(500) NOT NULL,
        PRIMARY KEY (id)
    );

ALTER TABLE IF EXISTS bookstore.authors
    OWNER TO postgres;

-- Books
CREATE TABLE bookstore.books
    (
        id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
        title character varying(255) NOT NULL,
        description character varying(255) NOT NULL,
        isbn character(13) NOT NULL,
        genre_id integer NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (genre_id) REFERENCES bookstore.genres (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID
    );

ALTER TABLE IF EXISTS bookstore.books
    OWNER TO postgres;

-- Books & Authors
CREATE TABLE bookstore.books_authors
    (
        book_id integer,
        author_id integer,
        is_main_author boolean NOT NULL DEFAULT FALSE,
        PRIMARY KEY (book_id, author_id),
        FOREIGN KEY (book_id) REFERENCES bookstore.books (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
        FOREIGN KEY (author_id) REFERENCES bookstore.authors (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID
    );

ALTER TABLE IF EXISTS bookstore.books_authors
    OWNER TO postgres;

-- Some data
INSERT INTO bookstore.authors(name, bio)
VALUES ('Jane Austen', 'Temporary bio'),
       ('Jules Verne', 'Temporary bio'),
       ('Leo Tolstoy', 'Temporary bio'),
       ('F. Scott Fitzgerald', 'Temporary bio'),
       ('Mark Twain', 'Temporary bio'),
       ('Fyodor Dostoevsky ', 'Temporary bio'),
       ('Charles Dickens', 'Temporary bio'),
       ('Herman Melville', 'Temporary bio'),
       ('Alice Walker', 'Temporary bio'),
       ('Toni Morrison', 'Temporary bio');

INSERT INTO bookstore.genres(name, description)
VALUES ('Fiction', 'Fiction literature'),
       ('Non-Fiction', 'Non-Fiction literature');

INSERT INTO bookstore.books(title, description, isbn, genre_id)
VALUES ('Pride and Prejudice', 'Temporary description', '1234567890121', 1),
       ('Journey to the Centre of the Earth', 'Temporary description', '1234567890122', 1),
       ('War and Peace', 'Temporary description', '1234567890123', 1),
       ('The Great Gatsby', 'Temporary description', '1234567890124', 1),
       ('Adventures of Huckleberry Finn', 'Temporary description', '1234567890125', 1),
       ('Crime and Punishment', 'Temporary description', '1234567890126', 1),
       ('Great Expectations', 'Temporary description', '1234567890127', 1),
       ('Moby Dick', 'Temporary description', '1234567890128', 1),
       ('Song of Solomon', 'Temporary description', '1234567890129', 1),
       ('The Color Purple', 'Temporary description', '1234567890120', 1);

INSERT INTO bookstore.books_authors(book_id, author_id, is_main_author)
VALUES (1, 1, TRUE),
       (2, 2, TRUE),
       (3, 3, TRUE),
       (4, 4, TRUE),
       (5, 5, TRUE),
       (6, 6, TRUE),
       (7, 7, TRUE),
       (8, 8, TRUE),
       (9, 10, TRUE),
       (10, 9, TRUE);