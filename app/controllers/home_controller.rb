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
    @client = CoingeckoRuby::Client.new

    @name = params[:ticker]

    unless @name.nil?
       @token = @client.markets(params[:ticker].to_s, vs_currency:'usd')[0]
    end
  end
end
