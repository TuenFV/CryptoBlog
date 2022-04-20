class HomeController < ApplicationController
  require 'net/http'
  require 'json'

  # Grab News
  def index

    url = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
    uri = URI(url)
    respone = Net::HTTP.get(uri)
    @news = JSON.parse(respone)
  end

  # Grab Prices
  def prices

  url_price = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h%2C24h"
  uri_price = URI(url_price)
  respone_price = Net::HTTP.get(uri_price)
  #@respone_price['Authorization'] = '67595558-d5e2-4224-a42a-fb880e9458ca'
  @prices = JSON.parse(respone_price)

  url_top_search = "https://api.coingecko.com/api/v3/search/trending"
  uri_top_search = URI(url_top_search)
  respone_top_search = Net::HTTP.get(uri_top_search)
  @top_search = JSON.parse(respone_top_search)

  uri_btc = URI("https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd")
  respone_btc = Net::HTTP.get(uri_btc)
  @price_btc = JSON.parse(respone_btc)

  end
end
