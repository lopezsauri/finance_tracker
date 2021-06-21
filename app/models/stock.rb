class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol) #I can directrly call this method 
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
      ##client.price(ticker_symbol) #This is the return method**** It is implicit in Ruby
    rescue => exception
      return nil
    end
  end
end
