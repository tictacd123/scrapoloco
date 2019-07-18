require 'nokogiri' 
require 'open-uri'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{townhall_url[1..-1]}"))
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text # Fonctionne
  town_name = townhall_url[5..-6]
  { town_name => email }
end

def get_townhall_urls
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  page.xpath("//a[@class='lientxt']/@href")
end


def perform
    array_townhall_urls = Array.new
    # Pour chaque ville
    array_url_name = get_townhall_urls
    array_url_name.each do |url|
      array_townhall_urls << get_townhall_email(url.text)
    end
    array_townhall_urls
  end
  
puts perform

