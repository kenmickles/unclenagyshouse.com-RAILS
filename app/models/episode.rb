# encoding: UTF-8

class Episode < ActiveRecord::Base
  validates :title, :presence => true
  has_many :credits, -> { order "weight" }

  def pretty_number
    number.gsub(/\./, '')
  end

  def cast
    credits_by_category['cast'] || []
  end

  def crew
    credits_by_category['crew'] || []
  end

  def music
    credits_by_category['music'] || []
  end

  def special?
    !number.to_s.match(/([0-9]*)\.([0-9]*)/)
  end

  def download_url
    return if file_name.blank?
    "http://media.sfop.tv/#{file_name}"
  end

  def page_title
    if special?
      "Uncle Nagy’s House: #{title}"
    else
      "Uncle Nagy’s House ##{number}: #{title}"
    end
  end

  def next_episode
    @next_episode ||= Episode.where(["date > ? OR (date = ? AND number > ?)", date, date, number]).order(:date).first
  end

  def open_graph_tags
    @open_graph_tags ||= {
      'fb:app_id' => '165290657011952',
      'og:type' => 'video.episode',
      'og:title' => page_title,
      'og:site_name' => "Uncle Nagy’s House",
      'og:url' => Rails.application.routes.url_helpers.episode_url(pretty_number),
      'og:description' => synopsis,
      'og:image' => "http://unclenagyshouse.com#{ActionController::Base.helpers.image_path("episodes/#{pretty_number}.jpg")}",
      'video:series' => '14480480013',
      'og:video' => "http://vimeo.com/moogaloop.swf?clip_id=#{vimeo_id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1&amp;autoplay=0&amp;loop=0",
      'og:video:height' => '360',
      'og:video:width' => '640',
      'og:video:type' => 'application/x-shockwave-flash',
      'video:release_date' => date
    }
  end

  private

  def credits_by_category
    if @credits_by_category.nil?
      @credits_by_category = {}

      credits.each do |credit|
        @credits_by_category[credit.category] ||= []
        @credits_by_category[credit.category] << credit
      end
    end

    @credits_by_category
  end
end
