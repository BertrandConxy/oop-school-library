class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_json(*_args)
    {
      'json_class' => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person

    }
  end
end
