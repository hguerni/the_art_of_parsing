require 'nokogiri'
require 'open-uri'

def get_the_currency(market_url)
	page = Nokogiri::HTML(open(market_url))
	liste = Hash.new
	i = 1 ; j = 0
	while i <= page.css("a.price").size
		liste[page.xpath("/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/table/tbody/tr[#{i}]/td[2]/a").text] = page.xpath("/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/table/tbody/tr[#{i}]/td[5]/a").text
		system 'clear'
		puts "              ...LOADING, WAIT PLEASE...                \n" + ("|"*j+" "*(58-j)+"|")
		if j == 58
			j = 0 
		end
		i += 1
		j += 1
	end
	print liste
end

get_the_currency("https://coinmarketcap.com/all/views/all/")
