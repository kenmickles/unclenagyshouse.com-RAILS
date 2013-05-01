require 'spec_helper'

describe Credit do
  it "has a valid factory" do
    build(:credit).should be_valid
  end

  it "is invalid without an episode" do
    build(:credit, :episode_id => nil).should_not be_valid
  end

  it "is invalid without a category" do
    build(:credit, :category => nil).should_not be_valid
  end

  it "is invalid with a bad category" do
    build(:credit, :category => "moose").should_not be_valid
  end

  it "is invalid without a role" do
    build(:credit, :role => nil).should_not be_valid
  end

  it "belongs to episode" do
    create(:credit).episode.should be_a_kind_of Episode
  end

  it "has and belongs to many players" do
    player = create(:player)
    credit = create(:credit)
    credit.players << player
    credit.players.first.should eq player
  end
end
