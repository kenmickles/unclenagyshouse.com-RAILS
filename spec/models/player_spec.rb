require 'spec_helper'

describe Player do
  it "has a valid factory" do
    build(:player).should be_valid
  end

  it "is invalid without a name" do
    build(:player, :name => nil).should_not be_valid
  end

  it "has and belongs to many credits" do
    player = create(:player)
    credit = create(:credit)
    player.credits << credit
    player.credits.first.should eq credit
  end

  it "returns a link when one is present" do
    player = create(:player, :link => "https://www.google.com")
    player.link.should eq "https://www.google.com"
  end

  it "returns a facebook link when facebook_id is present but link is not" do
    player = create(:player, :link => nil, :facebook_id => 2)
    player.link.should eq "https://www.facebook.com/profile.php?id=2"
  end

  it "is invalid with a bad link" do
    build(:player, :link => "google.com").should_not be_valid
  end
end