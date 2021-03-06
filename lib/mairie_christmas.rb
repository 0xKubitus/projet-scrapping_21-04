require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rubocop'

$url = "http://annuaire-des-mairies.com/" # Le lien de base

# recuperer les href pour aller a chaque page du ville de Val d'oise
doc = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise"))

href = doc.css('.lientxt[href]')
href_arr = href.map do |link|
  link['href'].gsub(/^./, '') # un petit coup de .gsub pour mettre le lien nickel ;)
end

# reconstituer le lien complet pour acceder a chaque page
def full_link(arr)
  arr.map do |link|
    $url + link
  end
end

# Array pour stocker les liens de chaque page de ville
city_link = full_link(href_arr)

# method pour recuperer les emails de chaque page
def get_townhall_email(townhall_url)
  stream = URI.open(townhall_url)
  doc = Nokogiri::HTML(stream.read)
  a = doc.css('tbody tr')
  arr = a[3].text.split
  return arr[2]
end

# method pour recuperer les titres de chaques page
def get_city_names(url)
  doc = Nokogiri::HTML(URI.open(url))
  href = doc.css('.col-lg-offset-1')
  text = href.text.split
  return text[0]
end

# Pour afficher le resultat
def resultat(city_link)
  city_link.map do |element|
    result = []
    result << {get_city_names(element) => get_townhall_email(element)}
    puts result
  end
end

resultat(city_link)

# il faut faire une methode en plus pour le debut et tout compiler dans une methode 'perform'
# aussi il faudrait faire des tests avec Rspec 