require "rails_helper"

RSpec.describe "logs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/logs/#{log.id}", payload
  end

  describe "basic update" do
    let!(:log) { create(:log) }

    let(:payload) do
      {
        data: {
          id: log.id.to_s,
          type: "logs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(LogResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { log.reload.attributes }
    end
  end
end
