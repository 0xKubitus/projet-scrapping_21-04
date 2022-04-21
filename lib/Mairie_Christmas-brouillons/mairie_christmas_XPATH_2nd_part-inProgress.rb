require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

=begin
On vient de faire une methode qui donne l'email de la mairie d'une commune en fonction son URL dans l'annuaire.

Maintenant, il faut créer une methode 'get_townhall_urls' qui, à partir de cette page -> "https://www.annuaire-des-mairies.com/val-d-oise.html", doit : 
    ->récuperer les noms de chaque ville du 95 sur cette page (array)
    ->récuperer les URLs de chaque ville du 95 sur cette page (array)
    -> joindre les 2 arrays dans un array de hash suivant ce format : a = [  { "ville_1" => "email_1" },  { "ville_2" => "email_2" },   etc  ]
=end


  page_95_url = "https://www.annuaire-des-mairies.com/val-d-oise.html"
  page = Nokogiri::HTML(URI.open(page_95_url))

  liste_noms_mairies = []
  noms_mairies = page.xpath("//*[@class='lientxt']")
  noms_mairies.each do |nom|
    liste_noms_mairies << nom.text
  end
  
  puts liste_noms_mairies





=begin 

def get_townhall_email(townhall_url) 
  page_url = townhall_url
  page = Nokogiri::HTML(URI.open(page_url))

  nodeset_contenant_email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
  return nodeset_contenant_email.text
end

# p get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")

=end