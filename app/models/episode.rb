class Episode < ActiveRecord::Base
  attr_accessible :date, :number, :synopsis, :title, :vimeo_id
  validates :title, :presence => true
  has_many :credits, :order => 'weight'

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
