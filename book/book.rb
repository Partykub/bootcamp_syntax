# book.rb
class Book
  attr_accessor :id, :title, :author

  def initialize(id,title,author)
    @id = id
    @title = title
    @author = author
  end

  def info
    "ID: #{@id}, Title: #{@title}, Author: #{@author}"
  end

  
  def title
    @title
  end
end
