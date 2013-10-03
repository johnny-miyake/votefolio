class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :title, presence: true
end
