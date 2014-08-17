class PricesController < ApplicationController

  def index
  end


  def update_prices
    
    if Price.last
      previous_cad = Price.last.CAD
      previous_cny = Price.last.CNY
    end
    
    if Price.recent.last
      @price = Price.last
    else 
      begin 
        Timeout::timeout(DEFAULT_TIMEOUT) {
          cad = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CAD/")
          cny = HTTParty.get("https://api.bitcoinaverage.com/ticker/global/CNY/")
          previous_cad ||= cad["last"]
          previous_cny ||= cny["last"]
          @price = Price.new(:CAD => cad["last"], :CNY => cny["last"],
                             time: cad["timestamp"], prevCAD: previous_cad,
                             prevCNY: previous_cny)
          @price.save
        }
      rescue => e
        if Price.last
          @price = Price.last
        else
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
