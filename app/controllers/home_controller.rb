class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    # Grab News
    @url = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
    @uri = URI(@url)
    @respone = Net::HTTP.get(@uri)
    @news = JSON.parse(@respone)

    #Grab Prices
  end

  def prices
    @symbol = params[:ticker]
    @contract = params[:contract]
  end
end
