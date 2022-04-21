require_relative '../classes/person'


describe Person do
    before :each do
        @person = Person.new('Business ethics', 'Robert')
    end
    context 'given two arguments' do
        it "instantiate an object " do
            expect(@person).to be_instance_of(Person)
        end

        it "instatiate object with two properties" do
            expect(@person.title).to eql('Business ethics')
            expect(@person.author).to eql('Robert')
        end

        it "add a rental" do
            @student = Student.new('s1', 12, 'bertrand')
            expect(@book.rentals.length).to eql(0)
            @book.add_rental('2022-03-03', @student)
            expect(@book.rentals.length).to eql(1)
        end
    end