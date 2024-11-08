# book_service.rb
class BookService
  def initialize(repository = BookRepository.new)
    @repository = repository
  end

  def add_book(id, title, author)
    book1 = repository.find_by_id(id)
    book = Book.new(id, title, author)
    @repository.add(book)
  end

  def update_book(id, title:nil, author:nil)
    book = @repository.find_by_id(id)
    book&.title = title unless title.nil?
    book&.author = author unless author.nil?
    book
  end

  def delete_book(id)
    @repository.delete(id)
  end

  def list_books
    @repository.all
  end
end
