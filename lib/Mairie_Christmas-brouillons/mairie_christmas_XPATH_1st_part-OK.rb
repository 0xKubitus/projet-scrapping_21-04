require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

# 1) voici la page d'une mairie bien précise (c'est le même template pour toutes les mairies): 
PAGE_URL = "http://annuaire-des-mairies.com/95/ableiges.html"

# 2) On va ouvrir cette page avec Nokogiri et Open-URI:
page = Nokogiri::HTML(URI.open(PAGE_URL))

# 3) on récupère le XPATH qui nous intéresse (celui où se trouve l'adresse mail):
nodeset_contenant_email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")

puts nodeset_contenant_email.class
puts nodeset_contenant_email.text


