require "sinatra/base"
require "json"

module ExpenseTracker
  class API < Sinatra::Base

    def initialize(ledger: Ledger.new) # default value so callers can just say API.new and get the default
      @ledger = ledger
      super() # rest of initialization from Sinatra
    end

    # Later, callers do this ledger: Ledger.new
    # app = API.new()

    post '/expenses' do
      # JSON.generate('expense_id' => 42)
      # status 404 test the code by breaking it
      expense = JSON.parse(request.body.read)
      result = @ledger.record(expense)
      JSON.generate('expense_id' => result.expense_id)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end
