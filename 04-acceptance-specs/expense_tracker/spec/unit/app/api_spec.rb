require "../../../app/api"

module ExpenseTracker
  RSpec.describe API do
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
