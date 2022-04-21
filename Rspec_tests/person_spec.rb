require_relative '../classes/person'
require_relative '../classes/rental'
require_relative '../classes/book'


describe Person do
    before :each do
        @person = Person.new(15, 'Kandy Boy')
    end
    context 'given arguments' do
        it "instantiate an object " do
            expect(@person).to be_instance_of(Person)
        end

        it "instatiate object with all person properties" do
            expect(@person.id)
            expect(@person.name).to eql('Kandy Boy')
            expect(@person.age).to eql(15)
            expect(@person.parent_permission).to be true
        end
    end

    context 'when can_use_service? method is called' do
        it "return true or false" do
            expect(@person.can_use_services?).not_to be false
        end
    end

    context "when add rental method is callled" do
        it "add the rental to the array" do
            expect(@person.rentals.length).to eql(0)
            @book = Book.new('Kill it', 'man')
            @person.add_rental('2022-02-03', @book)
            expect(@person.rentals.length).to eql(1)
        end
    end
end