class Item < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :poll
  has_many :votes, dependent: :destroy
  scope :sort_by_votes, -> do
    group("items.id")
      .joins("left outer join votes")
      .select("items.*, COUNT(items.id) as items_count")
      .order("items_count DESC")
  end
end
