require "rails_helper"

RSpec.describe "logs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/logs/#{log.id}", params: params
  end

  describe "basic fetch" do
    let!(:log) { create(:log) }

    it "works" do
      expect(LogResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("logs")
      expect(d.id).to eq(log.id)
    end
  end
end
