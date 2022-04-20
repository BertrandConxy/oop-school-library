require_relative '../classes/decorator.rb'
require_relative '../classes/student.rb'

describe Nameable do
    before :each do
        person = Student.new('s1', 12, 'bertrandmutangana')
        @name = BaseDecorator.new(person)
        @capitalized = CapitalizeDecorator.new(@name)
        @trimmed = TrimmerDecorator.new(@name)
    end

    context "given argument" do
        it "instantiate objects" do
            expect(@name).to be_instance_of(BaseDecorator)
            expect(@capitalized).to be_instance_of(CapitalizeDecorator)
        end

        it "returns the name" do
            expect(@name.correct_name).to eql("bertrandmutangana")
        end
        
        it "capitalise the name" do
            expect(@capitalized.correct_name).to eql("Bertrandmutangana")
        end

        it "trims the name" do
            expect(@trimmed.correct_name).to eql("bertrandmu")
        end
    end
end