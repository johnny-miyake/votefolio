class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :title, presence: true

  scope :votable, ->{has_items}
  scope :has_items, ->{joins(:items).uniq}
end
