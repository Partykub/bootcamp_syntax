# library_test.rb

require 'minitest/autorun'
require_relative 'book_repository'
require_relative 'book_service'
require_relative 'book'

class LibraryTest < Minitest::Test
  def setup
    @repository = BookRepository.new
    @service = BookService.new(@repository)
  end

  def test_display_details_book
    book = Book.new(1, "New Book", "New Author")
    details_book = book.info
    assert_equal "ID: 1, Title: New Book, Author: New Author", details_book
  end

  def test_add_book
    new_book = @service.add_book(1, "New Book", "New Author")
     assert_equal "New Book", new_book.title
     assert_equal "New Author", new_book.author
     assert_equal 1, new_book.id
     assert_equal 1, @repository.all.size
  end

  def test_find_by_id
    @service.add_book(1, "Book Title 1", "Author 1")
    found_book = @repository.find_by_id(1)
    assert_equal "Book Title 1", found_book.title
    assert_equal "Author 1", found_book.author
    assert_nil @repository.find_by_id(2)
  end

  def test_update_book
    @service.add_book(1, "New Book", "New Author")

    updated_book_title = @service.update_book(1, title: "Updated Title")
    assert_equal "Updated Title", updated_book_title.title

    updated_book_author = @service.update_book(1, author: "Updated Author")
    assert_equal "Updated Author", updated_book_author.author

    assert_nil @service.update_book(2, title: "Non-Existent")
  end

  def test_delete_book
    @service.add_book(1, "New Book", "New Author")
    assert_equal 1, @repository.all.size

    @service.delete_book(1)
    assert_equal 0, @repository.all.size
    assert_nil @repository.find_by_id(1)
  end

  def test_list_books
    @service.add_book(1, "Book Title 1", "Author 1")
    @service.add_book(2, "Book Title 2", "Author 2")

    all_books = @service.list_books
    assert_equal 2, all_books.size
    assert_includes all_books, "ID: 1, Title: Book Title 1, Author: Author 1"
    assert_includes all_books, "ID: 2, Title: Book Title 2, Author: Author 2"
  end

  def test_add_duplicate_book_id
    @service.add_book(1, "Book Title 1", "Author 1")
    result = @service.add_book(1, "Book Title 2", "Author 2")

    assert_nil result
    assert_equal 1, @repository.all.size
  end

  def test_repository_empty_initially
    assert_empty @repository.all
  end

  def test_find_non_existent_book
    book = @repository.find_by_id(999)
    assert_nil book
  end
end
