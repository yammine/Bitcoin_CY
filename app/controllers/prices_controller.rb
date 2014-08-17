class PricesController < ApplicationController

  def index
  end


  def update_prices
    
    if Price.last
      previous_cad = Price.last.CAD # Assign previous_cad to the last recorded CAD price in DB
      previous_cny = Price.last.CNY # Assign previous_cny to the last recorded CNY price in DB
    end
    
    if Price.recent.last # If a price has been grabbed in the last 14 seconds then just pull from DB
      @price = Price.last
    else 
      begin # Check bitcoinaverage for latest price
        Timeout::timeout(10) { # Throw Timeout::Error after 10 seconds
          cad = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CAD/")
          cny = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CNY/")
          previous_cad ||= cad["last"] # Assign previous_cad to current CAD price if no previous price exists
          previous_cny ||= cny["last"] # Assign previous_cny to current CNY price if no previous price exists
          @price = Price.new(:CAD => cad["last"], :CNY => cny["last"],
                             time: cad["timestamp"], prevCAD: previous_cad,
                             prevCNY: previous_cny)
          @price.save
        }
      rescue => e
        if Price.last # Output last price recorded if Timeout occurs
          @price = Price.last
        else # If no previous price exists - show unavailable
          @price = { :CAD => "Unavailable", :CNY => "Unavailable",
                     time: Time.now, prevCAD: "Unavailable",
                     prevCNY: "Unavailable" }
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
