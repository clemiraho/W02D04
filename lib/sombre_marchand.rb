require 'rubygems'
require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
row = page.css('div.table-responsive.compact-name-column table#currencies-all tr')

### Isoler les éléments HTML qui vont bien
row.each do |row|
  symbol = row.css('td.text-left.col-symbol')
  price = row.css('td.no-wrap.text-right a.price')

### Creer un array des cryptos
  crypto = []
  symbol.each do |symbol|
   crypto << symbol.text
  end

### Creer un array des prix
  value = []
  price.each do |price|
    value << price.text.delete_prefix("$").to_f.round(2)
  end

### Rejoindre les crytpos avec leur prix dans un hash
  hash = Hash[crypto.zip(value)]

### Creer un array de hash avec les valeurs
  a = []
  hash.each do 
    a << hash
  end

### Imprimer l'array de hash
  puts a

end