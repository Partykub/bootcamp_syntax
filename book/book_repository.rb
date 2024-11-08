# book_repository.rb
class BookRepository
  def initialize
    @books = []
  end

  def add(book)
    @books << book
    book
  end

  def find_by_id(id)
    book_finded =  @books.find do |book|book.id == id
    end
    book_finded
  end

  def delete(id)
    book_finded = find_by_id(id)
    @books.delete(book_finded)
  end

  def all
    list = []
    @books.each {
      |book| list << book.info
    }
    list
  end
end
