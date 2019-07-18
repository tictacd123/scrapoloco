require 'nokogiri'
require 'open-uri'
require 'pry'


def get_depute_infos(depute_url,name)
  # Récupère le prénom, nom et mail du député
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{depute_url}"))
  begin
    email_output = page.xpath('/html/body/div/div[3]/div/div/div/section[2]/div/div/div/article/div/section/dl/dd[2]/a[contains(@href, "mailto")]').text
    if email_output == ""
      email_output = "Aucun email"
    end
  rescue
  end
  array_name = name.split
  first_name=array_name[1]
  last_name=array_name[2..-1].join(' ')
  {"first_name" => first_name, "last_name" => last_name, "email" => email_output}
end

def get_depute_urls
  # On récupère l'url des députés
  page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  url = page.xpath('//body/div/div[3]/div/div/section/div/article/div[3]/div/div/div/ul/li/a/@href')
  names = page.xpath('//body/div/div[3]/div/div/section/div/article/div[3]/div/div/div/ul/li/a')
  [url, names]
end

def perform
  array_all_deputes = Array.new
  array_url_names = get_depute_urls
  array_url_names[0].length.times do |i|
    array_all_deputes << get_depute_infos(array_url_names[0][i].text, array_url_names[1][i].text)
  end
  array_all_deputes
end
# puts perform