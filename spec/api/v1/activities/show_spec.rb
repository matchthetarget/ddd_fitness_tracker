require "rails_helper"

RSpec.describe "activities#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/activities/#{activity.id}", params: params
  end

  describe "basic fetch" do
    let!(:activity) { create(:activity) }

    it "works" do
      expect(ActivityResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("activities")
      expect(d.id).to eq(activity.id)
    end
  end
end
