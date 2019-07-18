require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrap

    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    symbol = page.xpath("//*[@id]/td[3]")
    price = page.xpath("//*[@id]/td[5]")
    combi_curr_price(symbol, price)
end

def combi_curr_price(array_curr,arr_price)
i= 0
array_return = []
  array_curr.length.times do |i|
    array_return << {array_curr[i].text=>arr_price[i].text.strip[1..-1].to_f}
  end
  array_return
end


puts scrap