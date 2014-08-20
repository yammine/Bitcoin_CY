class PricesController < ApplicationController

  def index
  end


  def update_prices
   
    if Price.recent.last # If a price has been grabbed in the last 14 seconds then just pull from DB
      @price = Price.last
    else 
      begin # Check bitcoinaverage for latest price
        Timeout::timeout(10) { # Throw Timeout::Error after 10 seconds
          cad = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CAD/")
          cny = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CNY/")
          gbp = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/GBP/")

          @price = Price.new(:CAD => cad["last"], :CNY => cny["last"],
                             gbp: gbp["last"], time: cad["timestamp"])
          @price.save
        }
      rescue => e
        if Price.last # Output last price recorded if Timeout occurs
          @price = Price.last
        else # If no previous price exists - show unavailable
          @price = { :CAD => "Unavailable", :CNY => "Unavailable",
                     time: Time.now }
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
