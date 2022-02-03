require "rails_helper"

RSpec.describe "activities#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/activities/#{activity.id}"
  end

  describe "basic destroy" do
    let!(:activity) { create(:activity) }

    it "updates the resource" do
      expect(ActivityResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Activity.count }.by(-1)
      expect { activity.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
