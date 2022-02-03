require "rails_helper"

RSpec.describe LogResource, type: :resource do
  describe "serialization" do
    let!(:log) { create(:log) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(log.id)
      expect(data.jsonapi_type).to eq("logs")
    end
  end

  describe "filtering" do
    let!(:log1) { create(:log) }
    let!(:log2) { create(:log) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: log2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([log2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:log1) { create(:log) }
      let!(:log2) { create(:log) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      log1.id,
                                      log2.id,
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
                                      log2.id,
                                      log1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
