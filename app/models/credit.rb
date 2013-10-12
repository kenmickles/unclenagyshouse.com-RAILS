class Credit < ActiveRecord::Base
  validates :episode, :category, :role, :presence => true
  validates :category, :inclusion => { :in => %w(cast crew music) }
  belongs_to :episode
  has_and_belongs_to_many :players
end
