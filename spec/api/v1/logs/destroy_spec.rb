require "rails_helper"

RSpec.describe "logs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/logs/#{log.id}"
  end

  describe "basic destroy" do
    let!(:log) { create(:log) }

    it "updates the resource" do
      expect(LogResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Log.count }.by(-1)
      expect { log.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
