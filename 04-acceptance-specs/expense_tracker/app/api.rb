require "sinatra/base"
require "json"

module ExpenseTracker
  class API < Sinatra::Base

    def initialize(ledger: Ledger.new) # default value so callers can just say API.new and get the default
      @ledger = ledger
      super() # rest of initialization from Sinatra
    end

    # Later, callers do this ledger: Ledger.new
    app = API.new()

    post '/expenses' do
      JSON.generate('expense_id' => 42)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end
