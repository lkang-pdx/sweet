
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { is_expected.to have_many(:pins) }

  it { should validate_uniqueness_of(:username) }

  it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }

  describe "attributes" do
    it "should have username" do
      expect(user).to have_attributes(username: user.username)
    end
  end
end
