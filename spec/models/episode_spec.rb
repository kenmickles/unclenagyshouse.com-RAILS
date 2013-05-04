require 'spec_helper'

describe Episode do
  it "has a valid factory" do
    build(:episode).should be_valid
  end

  it "is invalid without a title" do
    build(:episode, :title => nil).should_not be_valid
  end

  it "has many credits" do
    ep = create(:episode)
    1.upto 3 do
      create(:credit, :episode => ep)
    end
    ep.credits.first.should be_a_kind_of Credit
  end

  it "returns a pretty number string" do
    ep = create(:episode)
    ep.pretty_number.should eq ep.number.gsub(/\./, '')
  end

  it "returns an array of cast credits" do
    ep = create(:episode)
    create(:credit, :episode => ep, :category => "cast")
    ep.cast.first.should be_a_kind_of Credit
  end

  it "returns an array of crew credits" do
    ep = create(:episode)
    create(:credit, :episode => ep, :category => "crew")
    ep.crew.first.should be_a_kind_of Credit
  end

  it "returns an array of music credits" do
    ep = create(:episode)
    create(:credit, :episode => ep, :category => "music")
    ep.music.first.should be_a_kind_of Credit
  end

  it "can tell if an episode is special" do
    build(:episode, :number => "1.05").special?.should be false
    build(:episode, :number => "moose").special?.should be true
  end
end
