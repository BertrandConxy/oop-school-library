require_relative '../classes/rental'

describe Rental do
  before :each do
    @rental1 = Rental.new('2022-03-03', 'jonathan', 'john')
  end
  context 'context given three arguments' do
    it 'instantiate an object ' do
      expect(@rental1).to be_instance_of(Rental)
    end

    it 'instatiate object with two properties' do
      expect(@rental1.date).to eql('2022-03-03')
      expect(@rental1.book).to eql('jonathan')
      expect(@rental1.person).to eql('john')
    end
  end
end
