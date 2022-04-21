#1) mettre tous mes require gems:
require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'


#2) mettre l'URL de la page qu'on veut scrapper:
PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(URI.open(PAGE_URL))


#3) faire une liste de tous les noms de crypto (ex: Bitcoin) dans un array:
crypto_names_array = []

names = page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[2]/div/a[2]")
names.each do |n|
  crypto_names_array << n.text
end
#p crypto_names_array


#4) pareil pour les prix:
crypto_prices_array = []

prices = page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[5]/div/a/span")
prices.each do |p|
  crypto_prices_array << p.text
end
#p crypto_prices_array


#5) maintenant il faut regrouper les résultats dans un hash:
crypto_recap = crypto_names_array.zip(crypto_prices_array).to_h
p crypto_recap
