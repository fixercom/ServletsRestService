CREATE TABLE IF NOT EXISTS authors
(
    id   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name VARCHAR(100)                            NOT NULL,

    CONSTRAINT pk_authors PRIMARY KEY (id),
    CONSTRAINT uc_authors_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS publishing_houses
(
    id   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name VARCHAR(100)                            NOT NULL,

    CONSTRAINT pk_publishing_houses PRIMARY KEY (id),
    CONSTRAINT uc_publishing_houses_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS books
(
    id                  BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    name                VARCHAR(100)                            NOT NULL,
    publishing_house_id BIGINT                                  NOT NULL,

    CONSTRAINT pk_books PRIMARY KEY (id),
    CONSTRAINT uc_books_name UNIQUE (name),
    constraint books_publishing_houses_id_fk foreign key (publishing_house_id) references publishing_houses (id)
);

CREATE TABLE IF NOT EXISTS author_books
(
    author_id BIGINT NOT NULL,
    book_id   BIGINT NOT NULL,

    CONSTRAINT pk_author_books PRIMARY KEY (author_id, book_id),
    constraint author_books_authors_id_fk foreign key (author_id) references authors (id) ON DELETE CASCADE,
    constraint author_books_books_id_fk foreign key (book_id) references books (id) ON DELETE CASCADE
);