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