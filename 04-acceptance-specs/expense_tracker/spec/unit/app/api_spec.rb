require_relative '../../../app/api'
require 'rack/test'

module ExpenseTracker
  # RecordResult = Struct.new(:success?, :expense_id, :error_message)

  RSpec.describe API do
    include Rack::Test::Methods

    def app
      API.new(ledger: ledger)
    end

    def parsed
      JSON.parse(last_response.body)
    end

    let(:ledger) { instance_double('ExpenseTracker::Ledger') }


    describe "POST /expenses" do
      context "when the expense is successfully recorded" do

        let(:expense) { {'some' => 'data'} }

        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(true, 417, nil))
        end

        it 'returns the expense id' do

        post '/expenses', JSON.generate(expense)

        expect(parsed).to include('expense_id' => 417)
        end
        it 'responds with a 200 (OK)' do

          post '/expenses', JSON.generate(expense)
          expect(last_response.status).to eq(200)

        end
      end

      context 'when the expense fails validation' do
        let(:expense) { {'some' => 'data'} }

        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(false, 417, 'Expense Incomplete'))
        end

        it 'returns an error message' do
          post '/expenses', JSON.generate(expense)

          expect(parsed).to include('error' => 'Expense Incomplete')
        end

        it 'responds with 422 (Unprocessable entity)' do
          post '/expenses', JSON.generate(expense)

          expect(last_response.status).to eq(422)
        end

      end

    end

    describe "GET /expenses/:date " do
      context "when expenses exist on a given date" do

        before do
          allow(ledger).to receive(:expenses_on)
            .with('2017-06-12')
            .and_return(['first_expense', 'second_expense'])
        end

        it "returns the expense record as JSON" do
          get '/expenses/2017-06-12'

          expect(parsed).to eq(['first_expense', 'second_expense'])
        end

        it "responds with a 200 OK" do
          get '/expenses/2017-06-12'

          expect(last_response.status).to eq(200)
        end
      end

      context "when there are no expenses on a given date" do
        before do
          allow(ledger).to receive(:expenses_on)
            .with('2017-06-12')
            .and_return([])
        end

        it "returns an empty array as JSON" do
          get '/expenses/2017-06-12'

          expect(parsed).to eq([])
        end

        it "responds with a 200 OK" do
          get '/expenses/2017-06-12'

          expect(last_response.status).to eq(200)
        end
      end
    end
  end
end
