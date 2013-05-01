require 'spec_helper'

describe "Pages" do
  %w(about contact subscribe).each do |page|
    describe "GET /#{page}" do
      it "renders the #{page} page" do
        get send("#{page}_path")
        response.should render_template page
      end
    end
  end
end