class PricesController < ApplicationController
  before_action :get_price, only: [ :index]
  require 'net/http'
  require 'json'

  def index
    @prices_api["data"].each do |token|
      @price = Price.find_by(name: "#{token["name"]}")
      @price.update( rank: token["rank"],
                     price: token["priceUsd"],
                     marketcap: token["marketCapUsd"],
                     supply: token["supply"],
                     volume24h: token["volumeUsd24Hr"],
                     changepercent24h: token["changePercent24Hr"]
                  )
    end
    @prices = Price.all.order(created_at: :asc)
  end

  private
    def get_price
      url_price = "https://api.coincap.io/v2/assets/?limit=50"
      uri_price = URI(url_price)
      respone_price = Net::HTTP.get(uri_price)
      @prices_api = JSON.parse(respone_price)
    end
end
