class EpisodesController < ApplicationController
  def index
    @episodes = Episode.where(true).order(:date)
  end

  def show
    @episode = Episode.where(["REPLACE(number, '.', '') = ?", params[:number]]).first
    raise ActiveRecord::RecordNotFound if @episode.nil?

    @page_title = @episode.page_title
    @open_graph_tags = @episode.open_graph_tags.merge('og:title' => @page_title)
  end
end