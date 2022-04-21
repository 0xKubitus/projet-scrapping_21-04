require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

# il faudra ajouter une methode 'get_townhall_urls' qui récupère les URLs de chaque ville du Val d'Oise sur cette page -> https://www.annuaire-des-mairies.com/val-d-oise.html

def get_townhall_email(townhall_url) 
  page_url = townhall_url
  page = Nokogiri::HTML(URI.open(page_url))

  nodeset_contenant_email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
  return nodeset_contenant_email.text
end

p get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")


