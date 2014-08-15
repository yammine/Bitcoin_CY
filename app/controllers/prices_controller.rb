class PricesController < ApplicationController

  def index
  end


  def update_prices
    
    if Price.recent.last
      @price = Price.last
    else 
      cad = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CAD/")
      usd = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/USD/")
      @price = Price.new(:CAD => cad["last"], :USD => usd["last"], time: cad["timestamp"])
      @price.save
    end

    render json: @price

  end

  private

  # def price_params
  #   params.require(:price).permit(:CAD, :USD, :time)
  # end

end
