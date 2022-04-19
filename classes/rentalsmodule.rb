require_relative './rental'
class RentalsModules
    attr_accessor :rentals
def initialize
    @rentals = []
    def list_all_rentals
        puts 'No rentals has been made at the moment' if @rentals.empty?
        print 'To view your rental records, type your ID: '
        id = gets.chomp.to_i
        rental = @rentals.select { |rend| rend.person.id == id }
        if rental.empty?
          puts 'No records for that particular ID'
        else
          puts 'Your rental records are the following: '
          puts ''
          rental.each_with_index do |record, index|
            puts "#{index + 1}| Date: #{record.date} | Borrower: #{record.person.name}
             | Status: #{record.person.class} | Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
          end
        end
      end 
end
    