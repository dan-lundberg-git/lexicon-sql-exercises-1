-- Using PostgreSQL and pgAdmin, so flavor of SQL is set to that environment.

-- Exercise 4.1: Inner Join
SELECT authors.name, books.title
  FROM bookstore.books_authors
           JOIN bookstore.authors
           ON authors.id = books_authors.author_id
           JOIN bookstore.books
           ON books.id = books_authors.book_id

-- Result:
-- "Jane Austen"            "Pride and Prejudice"
-- "Jules Verne"            "Journey to the Centre of the Earth"
-- "Leo Tolstoy"            "War and Peace"
-- "F. Scott Fitzgerald"    "The Great Gatsby"
-- "Mark Twain"	            "Adventures of Huckleberry Finn"
-- "Fyodor Dostoevsky"      "Crime and Punishment"
-- "Charles Dickens"        "Great Expectations"
-- "Herman Melville"        "Moby Dick"
-- "Toni Morrison"          "Song of Solomon"
-- "Alice Walker"           "The Color Purple"

-- Exercise 4.2: Left Join
SELECT authors.name, books.title
  FROM bookstore.authors
           LEFT JOIN bookstore.books_authors
           ON books_authors.author_id = authors.id
           LEFT JOIN bookstore.books
           ON books.id = books_authors.book_id

-- Result:
-- "Jane Austen"            "Pride and Prejudice"
-- "Jules Verne"            "Journey to the Centre of the Earth"
-- "Leo Tolstoy"            "War and Peace"
-- "F. Scott Fitzgerald"    "The Great Gatsby"
-- "Mark Twain"	            "Adventures of Huckleberry Finn"
-- "Fyodor Dostoevsky"	    "Crime and Punishment"
-- "Charles Dickens"        "Great Expectations"
-- "Herman Melville"        "Moby Dick"
-- "Toni Morrison"          "Song of Solomon"
-- "Alice Walker"           "The Color Purple"
-- "John Cleese"
-- "Bruce Dickinson"