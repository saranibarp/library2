class Item < ActiveRecord::Base
  belongs_to :item_type
  validates :title, presence: true

  def completed?
    !completed_on.nil?
  end

  def fetch_image
    update_attribute(:image_url, ImageFetcher.new.fetch(title))
  end

  def mark_as_completed
    update_attribute(:completed_on, Date.today)
  end
end