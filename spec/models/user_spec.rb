require 'rails_helper'

RSpec.describe User, type: :model do
  describe "field validation" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password).is_at_least(6).with_message("is too short (minimum is 6 characters)") }
  end
end
