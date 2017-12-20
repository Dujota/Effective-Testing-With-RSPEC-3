require "../../../app/ledger"
require "../../../sequel"
require "../../support/db"

module ExpenseTracker
  RSpec.describe Ledger do
    let(:ledger) { Ledger.new}

    let(:expense) do
      {
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      }
    end

    describe "#record" do
      context "with a valid expense" do
        it "successfully saves the expense in the DB" do
          result = ledger.record(expense)

        end

      end
    end

  end
end
