puts "Please input stock prices separated with spaces"
prices = gets.chomp.split.map(&:to_i)

buy_index = 0
prices.each do |price|
	price
	buy_index = prices.index(price) if prices[buy_index] > price
end

if buy_index == prices.length - 1
	puts "Don't buy"
else
	sell_index = buy_index + 1
	for index in sell_index...prices.length
		sell_index = index if prices[sell_index] < prices[index]
	end
	puts "Buy at day #{buy_index.to_s}, sell at day #{sell_index.to_s}."
end