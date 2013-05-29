

# populate array with DIJA data (closing price Monday)
# populate array with trends data (previous week ending on sunday)
# create the 3 week averaged trends array
# look at each value and choose to buy / sell accordingly
# update a counter with profit / loss

def trends
	$trends = load_csvs('trends.csv')
	$djia = load_csvs('DJIA.csv')
	puts $trends[0][0]
	puts $djia[0][0]
end


def load_csvs(filename)
output = Array.new
CSV.foreach(filename) do |row|
output << row
end

return output
end



trends # start the functions chain


#end #class