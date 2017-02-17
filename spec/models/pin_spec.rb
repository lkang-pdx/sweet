require 'rails_helper'

RSpec.describe Pin, type: :model do
  let(:pin) { create(:pin) }

  it { should have_attached_file(:pin_image) }
  it { should validate_attachment_content_type(:pin_image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }

  describe "attributes" do
    it "has a description" do
      expect(pin).to have_attributes(description: pin.description)
    end
  end
end
