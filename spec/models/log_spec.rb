require "rails_helper"

RSpec.describe Log, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:activity) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
