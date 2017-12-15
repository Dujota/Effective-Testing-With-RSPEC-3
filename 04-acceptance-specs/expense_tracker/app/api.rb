require "sinatra/base"
require "json"

module ExpenseTracker
  class API < Sinatra::Base

    def initializer(ledger: Ledger.new) # default value so callers can just say API.new and get the default
      @ledger = ledger
      super() # rest of initialization from Sinatra
    end

    # Later, callers do this
    app = API.new(ledger: Ledger.new)

    post '/expenses' do
      JSON.generate('expense_id' => 42)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end
