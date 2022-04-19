require_relative './book'
require 'json'

class BookModule
  attr_accessor :books

  def initialize
    @storage_file = './storage/books.json'
    file = JSON.parse(File.read(@storage_file))
    @books = file.empty? ? [] : file
  end

  def list_all_books
    puts 'Sorry, there are no books available at the moment' if @books.empty?
    puts "There are #{@books.count} book(s) in the system"
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Book Title: \"#{book['title']}\" | Author: #{book['author']}"
    end
  end

  def create_book
    print 'Enter the book title: '
    title = gets.chomp
    print 'Enter the book author: '
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      book = book.to_json
      @books << book
      File.write(@storage_file, JSON[@books])
      puts ''
      puts 'Book is created successfully'
    else
      puts ''
      puts 'Please provide title and author of the book'
    end
  end
end
