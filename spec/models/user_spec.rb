require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    # @user = FactoryBot.create(:user)
    @user = User.create()
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#username" do
      it { expect(@user).to validate_presence_of(:first_name) }
    end
  end

  context "associations" do

    describe "gossips" do
      it { expect(@user).to have_many(:gossips) }
    end

  end
end
