require "rails_helper"

RSpec.describe "activities#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activities", params: params
  end

  describe "basic fetch" do
    let!(:activity1) { create(:activity) }
    let!(:activity2) { create(:activity) }

    it "works" do
      expect(ActivityResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["activities"])
      expect(d.map(&:id)).to match_array([activity1.id, activity2.id])
    end
  end
end
