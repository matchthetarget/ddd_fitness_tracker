require "rails_helper"

RSpec.describe ActivityResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "activities",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ActivityResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Activity.count }.by(1)
    end
  end

  describe "updating" do
    let!(:activity) { create(:activity) }

    let(:payload) do
      {
        data: {
          id: activity.id.to_s,
          type: "activities",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ActivityResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { activity.reload.updated_at }
      # .and change { activity.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:activity) { create(:activity) }

    let(:instance) do
      ActivityResource.find(id: activity.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Activity.count }.by(-1)
    end
  end
end
