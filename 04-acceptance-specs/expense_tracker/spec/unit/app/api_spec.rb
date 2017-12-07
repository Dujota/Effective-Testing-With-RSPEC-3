require_relative "../../../app/api"
require "rack/test"

module ExpenseTracker

  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  RSpec.describe API do
    include Rack::Test::Methods

    def app
      API.new(ledger: ledger)
    end

    let(:ledger) {  instance_double('ExpenseTracker::Ledger') }

    describe "POST /expense" do
      context "when the expenseis successfully recorded" do
        it 'returns the expense id'
        it 'responds with a 200 (OK)'
      end

      context "when the expense fails validation" do
        it 'returns an error message'
        it 'responds with 422 (Unprocessable entity)'
      end

    end
  end
end
