class HomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index

    # Grab News
    @url = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
    @uri = URI(@url)
    @respone = Net::HTTP.get(@uri)
    @news = JSON.parse(@respone)
  end
    #Grab Prices

  def prices

  @url_price = "https://api.coincap.io/v2/assets/?limit=25"
  @uri_price = URI(@url_price)
  @respone_price = Net::HTTP.get(@uri_price)
  #@respone_price['Authorization'] = '67595558-d5e2-4224-a42a-fb880e9458ca'
  @prices = JSON.parse(@respone_price)
  end
end
