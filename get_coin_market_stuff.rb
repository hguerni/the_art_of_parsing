require 'nokogiri'
require 'open-uri'

def get_the_currency(market_url)
	doc = Nokogiri::HTML(open(market_url))
	doc1 = doc.xpath("/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/a")
	print doc1.text
end

get_the_currency("https://coinmarketcap.com/all/views/all/")

