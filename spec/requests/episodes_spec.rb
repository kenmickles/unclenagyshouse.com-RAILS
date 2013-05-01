require 'spec_helper'

describe "Episodes" do
  describe "GET /" do
    it "renders the index template with no episodes" do
      Episode.destroy_all
      get root_path
      response.should render_template :index
    end

    it "renders the index template with episodes" do
      3.times { create(:episode) }
      get root_path
      response.should render_template :index
    end

    it "assigns a list of episodes ordered by date to @episodes" do
      episodes = []
      1.upto 5 do |i|
        episodes << create(:episode, :date => "2012-03-0#{i}")
      end

      get root_path
      assigns(:episodes).should eq episodes
    end
  end

  describe "GET /episodes/:number" do
    it "renders the show template" do
      ep = create(:episode)
      get episode_path(ep.pretty_number)
      response.should render_template :show
    end

    it "404s on missing episodes" do
      expect { get episode_path(212121) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end