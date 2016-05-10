--Brian Jahnke
drop table if exists booksout;
drop table if exists loansin;
drop table if exists loansout;
drop table if exists writtenby;
drop table if exists allbooks;
DROP TABLE if exists uniquebooks;
drop table if exists authors;
drop table if exists members;


--Books in the library's system with unique isbn numbers
CREATE TABLE uniquebooks
(
	isbn int NOT NULL,
	title text NOT NULL,	
	genre text NOT NULL,
	
	PRIMARY KEY(isbn)
);

--Every book in the library's system disregarding unique isbn
CREATE TABLE allBooks
(
	bid SERIAL PRIMARY KEY,
	isbn int NOT NULL REFERENCES uniqueBooks(isbn)
);

--Authors of books in the library's system
CREATE TABLE authors
(
	aid SERIAL PRIMARY KEY,
	fname text NOT NULL,
	lname text NOT NULL
);

--Authors and the books they wrote within the system
CREATE TABLE writtenby
(
	aid int NOT NULL REFERENCES authors(aid),
	isbn int NOT NULL REFERENCES uniqueBooks(isbn)
);
--Members that belong to this library
CREATE TABLE members
(
	mid SERIAL PRIMARY KEY,
	fname text NOT NULL,
	lname text NOT NULL,
	email text NOT NULL,
	primaryPhone text NOT NULL,
	onProbation boolean NOT NULL
);

--List of Books currently taken out by a memeber
CREATE TABLE booksOut
(
	mid int NOT NULL REFERENCES members(mid),
	bid int NOT NULL REFERENCES allBooks(bid),
	DateofCheckout Date,
	DateDue Date
);

--Books currently being loaned by library members 
CREATE TABLE loansIn
(
	lid int NOT NULL,
	mid int NOT NULL REFERENCES members(mid),
	title text NOT NULL,
	author text NOT NULL,
	genre text NOT NULL, 
	PRIMARY KEY(lid)
);

--Books in library system currently loaned to other libraries
CREATE TABLE loansOut
(
	bid int NOT NULL REFERENCES allBooks(bid),
	DateofCheckout Date,
	DateDue Date
	
);

--INSERT INTO Agents( aid, name, city, percent )
 -- VALUES('a01', 'Smith', 'New York', 6 );
-- Members Data --
INSERT INTO members(fname, lname, email, primaryPhone, onProbation)
	VALUES('Jal', 'Gandhi', 'gandhi@email.com', '631-555-1349', false);

INSERT INTO members(fname, lname, email, primaryPhone, onProbation)
	VALUES('John', 'DiBlasi', 'diblasi@email.com', '631-555-2326', false);

INSERT INTO members(fname, lname, email, primaryPhone, onProbation)
	VAlUES('Lindsey', 'Hans', 'hans@email.com', '631-555-2968', false );

INSERT INTO members(fname, lname, email, primaryPhone, onProbation)
	VALUES('James', 'Variano', 'variano@email.com', '631-555-7325', false);

INSERT INTO members(fname, lname, email, primaryPhone, onProbation)
	VALUES('Casey', 'Connolly', 'connolly@email.com', '631-555-4958', false);

INSERT INTO members(fname, lname, email, primaryPhone, onProbation)
	VALUES('Emily', 'Grupski', 'grupski@email.com', '631-555-1095', false);


-- Books Data --

INSERT INTO uniquebooks(title, genre, isbn)
	VALUES('The Count of Monte Cristo', 'Adventure', 17713);

INSERT INTO uniquebooks(title, genre, isbn)
	VALUES('The Lord of the Rings', 'High Fantasy', 29527);

INSERT INTO uniquebooks(title, genre, isbn)
	VALUES('The Hobbit', 'High Fantasy', 11000);

INSERT INTO uniquebooks(title, genre, isbn)
	VALUES('The Alchemist', 'Fantasy', 16017);

INSERT INTO uniquebooks(title, genre, isbn)
	VALUES('House to House', 'Autobiography',  23608);

INSERT INTO uniquebooks(title, genre, isbn)
	VALUES('How I Got a Nuke on MW2', 'Autobiography', 12525);

INSERT INTO uniquebooks(title, genre, isbn)
	VALUES('American Sniper', 'Autobiography', 98821);

-- Authors --

INSERT INTO authors(fname, lname) 
	VALUES('Jordan', 'Garafolo'); --1

INSERT INTO authors(fname, lname)
	VALUES('Alexandre', 'Dumas'); --2

INSERT INTO authors(fname, lname)
	VALUES('J.R.R', 'Tolkien');   --3

INSERT INTO authors(fname, lname)
	VALUES('David', 'Bellavia');  --4

INSERT INTO authors(fname, lname)
	VALUES('John', 'Bruning');    --5
 
INSERT INTO authors(fname, lname)
	VALUES('Chris', 'Kyle');      --6

INSERT INTO authors(fname, lname)
	VALUES('Scott', 'McEwen');    --7

INSERT INTO authors(fname, lname)
	VALUES('Jim', 'DeFelice');    --8

INSERT INTO authors(fname, lname)
	VALUES('Paulo', 'Ceolho');    --9


-- WrittenBy -- 
INSERT INTO writtenby(aid, isbn) 
	VALUES(1, 12525);          

INSERT INTO writtenby(aid, isbn) 
	VALUES(2, 17713);

INSERT INTO writtenby(aid, isbn) 
	VALUES(3, 29527);

INSERT INTO writtenby(aid, isbn)
	VALUES(3, 11000);

INSERT INTO writtenby(aid, isbn) 
	VALUES(4, 23608);

INSERT INTO writtenby(aid, isbn)
	VALUES(5, 23608);

INSERT INTO writtenby(aid, isbn)
	VALUES(6, 98821);

INSERT INTO writtenby(aid, isbn)
	VALUES(7, 98821);

INSERT INTO writtenby(aid, isbn)
	VALUES(8, 98821);

INSERT INTO writtenby(aid, isbn)
	VALUES(9, 16017);

--allbooks Data--

INSERT INTO allbooks(isbn)
	VALUES(12525);

INSERT INTO allbooks(isbn)
	VALUES(12525);

INSERT INTO allbooks(isbn)
	VALUES(17713);

INSERT INTO allbooks(isbn)
	VALUES(29527);

INSERT INTO allbooks(isbn)
	VALUES(29527);

INSERT INTO allbooks(isbn)
	VALUES(23608);

INSERT INTO allbooks(isbn)
	VALUES(98821);

INSERT INTO allbooks(isbn)
	VALUES(16017);

INSERT INTO allbooks(isbn)
	VALUES(11000);

INSERT INTO allbooks(isbn)
	VALUES(11000);

INSERT INTO allbooks(isbn)
	VALUES(11000);

--booksout data--

INSERT INTO booksout(mid, bid, dateofcheckout, datedue)
	VALUES(1, 11, '2016-4-1', '2016-4-15');

INSERT INTO booksout(mid, bid, dateofcheckout, datedue)
	VALUES(1, 8, '2016-4-5', '2016-4-19');

INSERT INTO booksout(mid, bid, dateofcheckout, datedue)
	VALUES(2, 7, '2016-4-3', '2016-4-17');

INSERT INTO booksout(mid, bid, dateofcheckout, datedue)
	VALUES(3, 6, '2016-4-7', '2016-4-21');

INSERT INTO booksout(mid, bid, dateofcheckout, datedue)
	VALUES(4, 5, '2016-4-10', '2016-4-24');

INSERT INTO booksout(mid, bid, dateofcheckout, datedue)
	VALUES(5, 4, '2016-4-6', '2016-4-20');

INSERT INTO booksout(mid, bid, dateofcheckout, datedue)
	VALUES(6, 3, '2016-4-3', '2016-4-17');

--loansout data--

--loansin data--



SELECT *
FROM members;

SELECT * 
FROM authors;

SELECT * 
FROM writtenby;

SELECT *
FROM allbooks;

SELECT * 
FROM booksout;





--VIEW 1.)
DROP VIEW IF EXISTS books_members_have;
CREATE OR REPLACE VIEW books_members_have AS
SELECT bo.bid, ub.title, bo.dateOfCheckout, bo.dateDue, m.fname, m.lname, m.mid
FROM booksout bo
INNER JOIN members m ON bo.mid = m.mid
INNER JOIN allbooks ab ON bo.bid = ab.bid
INNER JOIN uniquebooks ub ON ab.isbn = ub.isbn;

SELECT *
FROM books_members_have;

--VIEW 2.)
DROP VIEW IF EXISTS books_past_due;
CREATE OR REPLACE VIEW books_past_due AS
SELECT bid, title, dateDue, CAST(CURRENT_TIMESTAMP AS DATE)-dateDue AS daysPastDue, fname, lname, mid
FROM books_members_have
WHERE dateDue < CAST(CURRENT_TIMESTAMP AS DATE);

SELECT * 
FROM books_past_due;

--VIEW 3.)
CREATE OR REPLACE VIEW searchable_genres AS
SELECT DISTINCT genre
FROM uniqueBooks
ORDER BY genre ASC;

SELECT *
FROM searchable_genres;

--VIEW 4.)
CREATE OR REPLACE VIEW author_books AS
SELECT wb.isbn, ub.title, a.fname, a.lname
FROM writtenby wb
INNER JOIN uniquebooks ub ON wb.isbn = ub.isbn
INNER JOIN authors a ON wb.aid = a.aid;

SELECT *
FROM author_books;



--STORED PROCEDURE 1.)
CREATE OR REPLACE FUNCTION get_books_by_member(int, REFCURSOR) 
RETURNS REFCURSOR AS
$$
DECLARE
   memberID  int       := $1;
   resultset REFCURSOR := $2;
BEGIN 
   OPEN resultset FOR
   SELECT *
   FROM books_members_have
   WHERE memberID = mid;
RETURN resultset;
END;
$$
language plpgsql;

SELECT get_books_by_member(1, 'results');
FETCH ALL FROM results;

--STORED PROCEDURE 2.)
CREATE OR REPLACE FUNCTION get_books_by_genre(TEXT, REFCURSOR)
RETURNS REFCURSOR AS
$$
DECLARE 
   genreQ    TEXT        := $1;
   results   REFCURSOR   := $2;
BEGIN
   OPEN results FOR
      SELECT isbn, title
      FROM uniqueBooks
      WHERE genre LIKE genreQ;

   RETURN results;
END;
$$ language plpgsql;

SELECT get_books_by_genre('Autobiography', 'results');
FETCH ALL FROM results;

--STORRED PROCEDURE 3.)
CREATE OR REPLACE FUNCTION get_books_by_author_name(TEXT, TEXT, REFCURSOR)
RETURNS REFCURSOR AS 
$$
DECLARE 
   authorFname   TEXT        := $1;
   authorLname   TEXT        := $2;
   results       REFCURSOR   := $3;
BEGIN
   OPEN results FOR 
      SELECT isbn, title 
      FROM author_books
      WHERE fname LIKE authorFname
      AND lname LIKE authorLname;

   RETURN results;
END;
$$ language plpgsql;

SELECT get_books_by_author_name('J.R.R', 'Tolkien', 'results');
FETCH ALL FROM results;

--STORED PROCEDURE 4.)
CREATE OR REPLACE FUNCTION get_aid(TEXT, TEXT)
RETURNS INTEGER AS
$$
DECLARE
   authorFname   TEXT   := $1;
   authorLname   TEXT   := $2;
BEGIN 

RETURN (SELECT aid 
        FROM authors 
        WHERE fname LIKE authorFname
        AND lname LIKE authorLName);

END;
$$ language plpgsql;

SELECT get_aid('Chris', 'Kyle');

--STORED PROCEDURE 5.)
CREATE OR REPLACE FUNCTION add_book_info(INT, TEXT, TEXT, TEXT, TEXT)
RETURNS void AS
$$
DECLARE
   bookisbn      INT   := $1;
   booktitle     TEXT  := $2;
   bookgenre     TEXT  := $3;
   authorFname   TEXT  := $4;
   authorLname   TEXT  := $5;
BEGIN 
   IF get_aid(authorFname, authorLname) IS NULL
   THEN
      INSERT INTO authors(fname, lname)
         VALUES(authorFname, authorLname);
   END IF;
   IF (SELECT 1 FROM uniquebooks WHERE isbn = bookisbn LIMIT 1) IS NULL
   THEN 
      INSERT INTO uniquebooks(isbn, title, genre)
         VALUES(bookisbn, booktitle, bookgenre);
   END IF;
      
   IF (SELECT 1 
       FROM writtenby 
       WHERE isbn = bookisbn 
       AND aid = get_aid(authorFname, authorLname)
       LIMIT 1) IS NULL
       THEN
       
       INSERT INTO writtenby(aid, isbn)
          VALUES(get_aid(authorFname, authorLname), bookisbn);

   END IF;

   INSERT INTO allbooks(isbn)
         VALUES(bookisbn);

END;
$$ language plpgsql;

SELECT add_book_info(99999, 'Leaves of Grass', 'Poetry', 'Walt', 'Whitman');

--STORED PROCEDURE 6.)
CREATE OR REPLACE FUNCTION sign_out_book(INT, INT)
RETURNS void AS
$$
DECLARE
   memberID   INT   := $1;
   bookID     INT   := $2;
BEGIN
   IF (SELECT 1 FROM books_past_due WHERE mid = memberID) IS NULL THEN
      SELECT get_books_by_member(memberID, 'results');
      IF (SELECT COUNT(*) FROM results) < 3 THEN
         IF(SELECT 1
            FROM booksout
            WHERE bid = bookID) IS NULL THEN
               IF(SELECT 1 
                  FROM allbooks
                  WHERE bid = bookID) IS NOT NULL THEN

                     INSERT INTO booksout(mid, bid, dateofcheckout, dateDue)
                        VALUES(memberID, bookID, CONVERT(DATE, GETDATE()), DATEADD(day, 14, CONVERT(DATE, GETDATE())));
               ELSE 
                  RAISE EXCEPTION 'The book you requested does not exist in this library';
               END IF;
          ELSE 
             RAISE EXCEPTION 'The book requested for checkout is not available';
          END IF;

         ELSE 
         RAISE EXCEPTION 'This member has the limit of 3 books out and may not borrow another.';
      END IF; 
   ELSE 
      RAISE EXCEPTION 'This member may not sign out a book until their overdue book is returned.';
      
   END IF;
END;
$$ language plpgsql;

SELECT sign_out_book(2, 7);

--STORED PROCEDURE 7.)
CREATE OR REPLACE FUNCTION return_book(INT) 
RETURN void AS
$$
DECLARE 
   bookID   INT   := $1;
BEGIN 
 


