class PricesController < ApplicationController

  def index
  end


  def update_prices
    
      if Price.recent.last
        @price = Price.last
      else 
        begin 
          Timeout::timeout(10) {
            cad = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CAD/")
            cny = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CNY/")
            @price = Price.new(:CAD => cad["last"], :CNY => cny["last"], time: cad["timestamp"])
            @price.save
          }
        rescue => e
          if Price.last
            @price = Price.last
          else
            @price = { :CAD => "Unavailable", :CNY => "Unavailable", time: Time.now }
          end
        end
      end

    render json: @price

  end

  private

  # def price_params
  #   params.require(:price).permit(:CAD, :USD, :time)
  # end

end
