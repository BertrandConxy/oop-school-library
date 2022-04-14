#!/usr/bin/env ruby
require './app'

puts 'Welcome to OOP school library app'

def interface_options
  puts ''
  puts " Please choose among the options below by pressing its corresponding number:
            1. List all books
            2. List all people
            3. Create person account
            4. Create a book
            5. Create a rental
            6. List all rentals for particular person
            7. Exit"
  gets.chomp
end

def main
  app = App.new
  app.start_console
end

def option
  case interface_options
  when '1'
    list_all_books
  when '2'
    list_all_people
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_all_rentals
  when '7'
    puts 'Thank you for using the app!'
  else
    puts 'Invalid input. Please try again'
  end
  option
end

main
