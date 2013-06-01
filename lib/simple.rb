

# populate array with DIJA data (closing price Monday)
# populate array with trends data (previous week ending on sunday)
# create the 3 week averaged trends array
# look at each value and choose to buy / sell accordingly
# update a counter with profit / loss




def trends
	trends = load_csvs('trends.csv') #SAVE TO DATABASE
	djia = load_csvs('DJIA.csv') #SAVE TO DATABASE

	# chop up for different time periods

	#trends = trends[106..157]
	#djia = djia[106..157]

	trend_change_array = trend_change(trends, djia)
	save_to_csv(trend_change_array, "trendchange.csv")

	value_track = buy_or_sell(trend_change_array,djia)
	save_to_csv(value_track,"value.csv")

end


def load_csvs(filename)
	output = Array.new
	CSV.foreach(filename) do |row|
		output << row[1].to_i
	end

	return output
end


def trend_change(trends, djia) 

	trend_change_array = Array.new

	trends.each_with_index do |trend, index|
	
	if index > 2
	puts trend
	puts trends[index-1]	
	puts trends[index-2]
	puts trends[index-3]
	trend_change_array << trend-((trends[index-1] + trends[index-2] + trends[index-3])/3)

	else

	trend_change_array << 0	

	end

	end

	return trend_change_array

end




def buy_or_sell(trend_change_array, djia) # start from 3 as average of 3

value = Array.new # so can map change over time
current_value = 1000

len = (trend_change_array.length)-4

trend_change_array[0..len].each_with_index do |trend, index|
dijaindex=index+1 #  want to look at the week AFTER the prediction

	if trend > 0 # increase in searchs for debt

		puts "--"
		puts trend
		puts current_value
		puts djia[dijaindex]
		current_value = current_value + djia[dijaindex] 
		puts current_value
		puts djia[dijaindex+1]
		current_value = current_value - djia[dijaindex+1]
		value << current_value
		puts current_value
		puts "--"

	elsif trend < 0 # reduction in searches

		puts "**"
		puts trend
		puts current_value
		puts djia[dijaindex]
		current_value = current_value - djia[dijaindex] 
				puts current_value
		puts djia[dijaindex+1]
		current_value = current_value + djia[dijaindex+1] 
				value << current_value
		puts current_value
		puts "**"


	else

		value << current_value

	end

	end

	return value

end





def save_to_csv(array_in,title)
CSV.open(title, "w") do |csv|
		array_in.each do |row_in|
			csv << [row_in]
		end
	end
end



trends # start the functions chain
