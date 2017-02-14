require 'rails_helper'

RSpec.describe Pin, type: :model do
  let(:pin) { create(:pin) }

  describe "attributes" do
    it "has a description" do
      expect(pin).to have_attributes(description: pin.description)
    end
  end
end
