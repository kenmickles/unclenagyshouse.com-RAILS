class Player < ActiveRecord::Base
  validates :name, :presence => true
  has_and_belongs_to_many :credits
  validates_format_of :link, :with => URI.regexp, :allow_nil => true

  def link
    read_attribute(:link) || ("https://www.facebook.com/profile.php?id=#{facebook_id}" if facebook_id.present?)
  end
end
