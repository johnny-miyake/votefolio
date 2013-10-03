class Vote < ActiveRecord::Base
  belongs_to :poll
  belongs_to :item
  scope :by_item, ->item do
    where item_id: item.id
  end
end
