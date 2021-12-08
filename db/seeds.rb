# frozen_string_literal: true

# require 'net/http'
# require 'json'
# require 'faker'
# require 'csv'

# table = CSV.read('db/ProvincialSalesTax.csv')

# (1..table.length - 1).each do |x|
#   province = Province.new(name: table[x][0],
#                           PST: table[x][3],
#                           GST: table[x][1],
#                           HST: table[x][2])

#   province.save
# end

# # Status - Completed
# # Categories - Completed

# # Products
# n = 99
# e = ['Promo', 'Holo', 'Reverse Holo', 'Full Body', 'GX Half Body', 'EX Half Body', 'V Half Art', 'Secret Rare',
#      'Rainbow Rare', 'Shiny', 'VMAX']
# c = ['Used', 'Mint Condition', 'New', 'Collectible']

# (0..n).each do |i|
#   random_n = rand(n)
#   random_e = rand(e.length)
#   random_c = rand(c.length)
#   random_number = rand(9)
#   year = Faker::Date.between(from: '1998-01-01', to: '2021-01-01').year

#   url = "https://pokeapi.co/api/v2/pokemon?limit=#{n}"
#   uri = URI(url)
#   response = Net::HTTP.get(uri)
#   json = JSON.parse(response)
#   results = json['results']

#   pokemon_name = results[random_n]['name']

#   puts "Working on product #{i} of #{n} [#{pokemon_name}]..."

#   n_url = "https://pokeapi.co/api/v2/pokemon/#{pokemon_name}"
#   n_uri = URI(n_url)
#   n_response = Net::HTTP.get(n_uri)
#   n_json = JSON.parse(n_response)

#   type = n_json['types'][0]['type']['name']

#   name = "#{year} #{e[random_e]} #{pokemon_name.capitalize}"
#   description = "#{c[random_c]}: #{Faker::Commerce.material} #{name}\nMoves: #{Faker::Games::Pokemon.move},
#                  #{Faker::Games::Pokemon.move}\nPromotional Code: #{Faker::Commerce.promotion_code}"

#   if random_number >= 0 && random_number <= 2
#     # Common ($0.50-$1.50)
#     price = Faker::Commerce.price(range: 0.5..1.5)
#     category = 1
#   elsif random_number > 2 && random_number <= 5
#     # Uncommon ($1.50-$5.00)
#     price = Faker::Commerce.price(range: 1.5..5)
#     category = 2
#   elsif random_number > 5 && random_number <= 7
#     # Rare ($10-$100)
#     price = Faker::Commerce.price(range: 10..100)
#     category = 3
#   elsif random_number > 7 && random_number <= 8
#     # Specialty ($150-$499)
#     price = Faker::Commerce.price(range: 150..499)
#     category = 4
#   else
#     # Ultra Rare ($500-$200000)
#     price = Faker::Commerce.price(range: 500..200_000)
#     category = 5
#   end

#   new_product = Product.new(name: name,
#                             description: description,
#                             price: price,
#                             pokemon_name: pokemon_name.capitalize,
#                             pokemon_type: type,
#                             pokemon_number: random_n + 1)

#   new_product.save

#   new_product_category = ProductCategory.new(product_id: new_product.id,
#                                              category_id: category)

#   new_product_category.save

#   unless new_product.valid?
#     new_product.errors.messages.each do |column, errors|
#       errors.each do |error|
#         puts "ERROR: #{column} #{error}"
#       end
#     end
#   end

#   next if new_product_category.valid?

#   new_product_category.errors.messages.each do |column, errors|
#     errors.each do |error|
#       puts "ERROR: #{column} #{error}"
#     end
#   end
# end
