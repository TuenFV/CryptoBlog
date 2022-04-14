# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'net/http'
require 'json'

url_price = "https://api.coincap.io/v2/assets/?limit=50"
uri_price = URI(url_price)
respone_price = Net::HTTP.get(uri_price)
prices_api = JSON.parse(respone_price)

prices_api["data"].each do |token|
  Price.create( rank: token["rank"],
                name: "#{token["name"]}",
                symbol: "#{token["symbol"]}",
                price: token["priceUsd"],
                marketcap: token["marketCapUsd"],
                supply: token["supply"],
                volume24h: token["volumeUsd24Hr"],
                changepercent24h: token["changePercent24Hr"]
              )
end
