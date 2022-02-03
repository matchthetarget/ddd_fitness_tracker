require "rails_helper"

RSpec.describe "activities#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/activities/#{activity.id}", payload
  end

  describe "basic update" do
    let!(:activity) { create(:activity) }

    let(:payload) do
      {
        data: {
          id: activity.id.to_s,
          type: "activities",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ActivityResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { activity.reload.attributes }
    end
  end
end
