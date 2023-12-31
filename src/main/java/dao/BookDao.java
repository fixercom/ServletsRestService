package dao;

import entity.Author;
import entity.Book;

import java.util.List;

public interface BookDao extends Dao<Long, Book> {

    List<Author> findAllAuthorsByBookId(Long bookId);

}
