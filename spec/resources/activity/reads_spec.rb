require "rails_helper"

RSpec.describe ActivityResource, type: :resource do
  describe "serialization" do
    let!(:activity) { create(:activity) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(activity.id)
      expect(data.jsonapi_type).to eq("activities")
    end
  end

  describe "filtering" do
    let!(:activity1) { create(:activity) }
    let!(:activity2) { create(:activity) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: activity2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([activity2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:activity1) { create(:activity) }
      let!(:activity2) { create(:activity) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      activity1.id,
                                      activity2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      activity2.id,
                                      activity1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
