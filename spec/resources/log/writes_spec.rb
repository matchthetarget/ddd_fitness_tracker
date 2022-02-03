require "rails_helper"

RSpec.describe LogResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "logs",
          attributes: {},
        },
      }
    end

    let(:instance) do
      LogResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Log.count }.by(1)
    end
  end

  describe "updating" do
    let!(:log) { create(:log) }

    let(:payload) do
      {
        data: {
          id: log.id.to_s,
          type: "logs",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      LogResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { log.reload.updated_at }
      # .and change { log.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:log) { create(:log) }

    let(:instance) do
      LogResource.find(id: log.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Log.count }.by(-1)
    end
  end
end
