require_relative '../classes/book'
require_relative '../classes/rental'
require_relative '../classes/student'

describe Book do
  before :each do
    @book = Book.new('Business ethics', 'Robert')
  end
  context 'given two arguments' do
    it 'instantiate an object ' do
      expect(@book).to be_instance_of(Book)
    end

    it 'instatiate object with two properties' do
      expect(@book.title).to eql('Business ethics')
      expect(@book.author).to eql('Robert')
    end

    it 'add a rental' do
      @student = Student.new('s1', 12, 'bertrand')
      expect(@book.rentals.length).to eql(0)
      @book.add_rental('2022-03-03', @student)
      expect(@book.rentals.length).to eql(1)
    end
  end
end
