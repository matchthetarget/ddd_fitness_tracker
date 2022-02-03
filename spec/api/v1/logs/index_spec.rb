require "rails_helper"

RSpec.describe "logs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/logs", params: params
  end

  describe "basic fetch" do
    let!(:log1) { create(:log) }
    let!(:log2) { create(:log) }

    it "works" do
      expect(LogResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["logs"])
      expect(d.map(&:id)).to match_array([log1.id, log2.id])
    end
  end
end
