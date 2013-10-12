# encoding: UTF-8

class EpisodesController < ApplicationController
  def index
    @episodes = Episode.where(true).order(:date)
  end

  def show
    @episode = Episode.where(["REPLACE(number, '.', '') = ?", params[:number]]).first
    raise ActiveRecord::RecordNotFound if @episode.nil?

    @next_episode = Episode.where(["date > ?", @episode.date]).order(:date).first

    if @episode.special?
      @page_title = "Uncle Nagy’s House: #{@episode.title}"
    else
      @page_title = "Uncle Nagy’s House ##{@episode.number}: #{@episode.title}"
    end
  end
end