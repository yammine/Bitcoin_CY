class PricesController < ApplicationController



  def update_prices
    cad = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CAD/")
    usd = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/USD/")
    @price = Price.new(:CAD => cad["last"], :USD => usd["last"], time: cad["timestamp"])
    @price.save

    render json: @price

  end

  private

  def price_params
    params.require(:price).permit(:CAD, :USD, :time)
  end

end
