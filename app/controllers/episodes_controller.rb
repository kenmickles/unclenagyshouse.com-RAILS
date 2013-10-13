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

    @open_graph_tags = {
      'fb:app_id' => '165290657011952',
      'og:type' => 'video.episode',
      'og:title' => @page_title,
      'og:site_name' => "Uncle Nagy’s House",
      'og:url' => episode_url(@episode.pretty_number),
      'og:description' => @episode.synopsis,
      'og:image' => "http://unclenagyshouse.com#{view_context.image_path("episodes/#{@episode.pretty_number}.jpg")}",
      'video:series' => '14480480013',
      'og:video' => "http://vimeo.com/moogaloop.swf?clip_id=#{@episode.vimeo_id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1&amp;autoplay=0&amp;loop=0",
      'og:video:height' => '360',
      'og:video:width' => '640',
      'og:video:type' => 'application/x-shockwave-flash',
      'video:release_date' => @episode.date
    }
  end
end