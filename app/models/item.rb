class Item < ActiveRecord::Base
  belongs_to :item_type
  validates :title, presence: true

  def completed?
    !completed_on.nil?
  end
end