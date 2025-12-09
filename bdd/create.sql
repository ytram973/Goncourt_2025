-- SQL script to create the database schema for the Goncourt book award application
-- tables: author
CREATE TABLE g_author (
  id_author      INT AUTO_INCREMENT PRIMARY KEY,
  a_first_name   VARCHAR(50) NOT NULL,
  a_last_name    VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- tables: publisher
CREATE TABLE g_publisher (
  id_publisher   INT AUTO_INCREMENT PRIMARY KEY,
  p_name         VARCHAR(150) NOT NULL
) ENGINE=InnoDB;
-- tables: book
CREATE TABLE g_book (
  id_book            INT AUTO_INCREMENT PRIMARY KEY,
  b_title            VARCHAR(255) NOT NULL,
  b_summary          TEXT,
  b_publication_date DATE,
  b_page_count       INT,
  b_main_character   VARCHAR(150),
  b_isbn             VARCHAR(20),
  b_price            DECIMAL(10,2),
  id_author          INT NOT NULL,
  id_publisher       INT NOT NULL,
  CONSTRAINT fk_book_author
    FOREIGN KEY (id_author) REFERENCES g_author(id_author),
  CONSTRAINT fk_book_publisher
    FOREIGN KEY (id_publisher) REFERENCES g_publisher(id_publisher)
) ENGINE=InnoDB;

-- tables: selection
CREATE TABLE g_selection (
  id_selection       INT AUTO_INCREMENT PRIMARY KEY,
  s_year_            INT NOT NULL,
  s_type             VARCHAR(20) NOT NULL,
  s_selection_date   DATE
) ENGINE=InnoDB;

-- tables: book_selection (association table between book and selection)
CREATE TABLE g_book_selection (
  id_book            INT NOT NULL,
  id_selection       INT NOT NULL,
  PRIMARY KEY (id_book, id_selection),
  CONSTRAINT fk_book_selection_book
    FOREIGN KEY (id_book) REFERENCES g_book(id_book),
  CONSTRAINT fk_book_selection_selection
    FOREIGN KEY (id_selection) REFERENCES g_selection(id_selection)
) ENGINE=InnoDB;

-- tables: vote_result
CREATE TABLE g_vote_result (
  id_vote_result     INT AUTO_INCREMENT PRIMARY KEY,
  v_votes_count      INT NOT NULL,
  id_book            INT NOT NULL,
  CONSTRAINT fk_vote_result_book
    FOREIGN KEY (id_book) REFERENCES g_book(id_book),
  CONSTRAINT uq_vote_result_book UNIQUE (id_book)
) ENGINE=InnoDB;

-- tables: jury_member
CREATE TABLE g_jury_member (
  id_jury_member     INT AUTO_INCREMENT PRIMARY KEY,
  j_first_name       VARCHAR(50) NOT NULL,
  j_last_name        VARCHAR(50) NOT NULL,
  j_login            VARCHAR(80) NOT NULL UNIQUE,
  j_password_hash    VARCHAR(255) NOT NULL,
  j_is_president     BOOLEAN NOT NULL DEFAULT FALSE
) ENGINE=InnoDB;
