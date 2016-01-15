require_relative '../enumerables'

describe Enumerable do
  describe 'my_each' do
    let(:array) { Array.new(5) { |i| i } }

    context 'without block given' do
      it 'returns Enumerator' do
        expect(array.my_each).to be_instance_of(Enumerator)
      end

      it 'leaves self unchanged' do
        expect { array.my_each }.not_to change { array }
      end
    end

    context 'with block given' do
      it 'yields with each item in self' do
        expect { |b| array.my_each(&b) }.to yield_successive_args(0, 1, 2, 3, 4)
      end

      it 'leaves self unchanged' do
        expect { array.my_each }.not_to change { array }
      end
    end
  end
end
