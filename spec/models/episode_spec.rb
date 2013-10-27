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

  it "returns a valid download_url" do
    build(:episode, file_name: "moose.mp4").download_url.should eq "http://media.sfop.tv/moose.mp4"
  end

  it "returns a nil download_url for episodes without a file name" do
    build(:episode, file_name: nil).download_url.should be_nil
  end

  it "returns the next chronological episode" do
    ep = create(:episode, date: Date.today)
    next_ep = create(:episode, date: Date.tomorrow)
    ep.next_episode.should eq next_ep
  end

  it "returns the correct next episode, even if the date is the same" do
    ep = create(:episode, date: Date.today, number: '3.37')
    next_ep = create(:episode, date: Date.today, number: '3.38')
    ep.next_episode.should eq next_ep
  end

  it "returns a valid open graph hash" do
    create(:episode).open_graph_tags.keys.sort.should eq %w(fb:app_id og:type og:title og:site_name og:url og:description og:image video:series og:video og:video:height og:video:width og:video:type video:release_date).sort
  end

  it "returns a valid page title" do
    create(:episode, title: 'Walrus Shindig', number: '3.37').page_title.should eq "Uncle Nagy’s House #3.37: Walrus Shindig"
    create(:episode, title: 'Walrus Shindig', number: 'walrus').page_title.should eq "Uncle Nagy’s House: Walrus Shindig"
    create(:episode, title: 'Walrus Shindig', number: nil).page_title.should eq "Uncle Nagy’s House: Walrus Shindig"
  end
end
