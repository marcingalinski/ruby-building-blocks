require_relative 'caesar_cipher.rb'

describe '#convert' do
	context 'with args \'a\', 1' do
		it 'return \'b\'' do
			expect(convert('a', 1)).to eql('b')
		end
	end

	context 'with args \'z\', 1' do
		it 'return \'a\'' do
			expect(convert('z', 1)).to eql('a')
		end
	end

	context 'with caps entered' do
		it 'converts caps' do
			expect(convert('A', 2)).to eql('C')
		end
	end

	context 'with multi char string' do
		it 'return converted string' do
			expect(convert('Ruby', 1)).to eql('Svcz')
		end
	end

	context 'with non-letters' do
		it 'converts just letters' do
			expect(convert(',. aba !21', 1)).to eql(',. bcb !21')
		end
	end
end