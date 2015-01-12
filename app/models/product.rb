class Product < ActiveRecord::Base

  is_impressionable counter_cache: true, column_name: :page_views
  # is_impressionable :counter_cache => true, :column_name => :impressions

  has_and_belongs_to_many :categories
  belongs_to :affiliate_program
  belongs_to :merchant
  belongs_to :brand

  def self.search(query)
    where("description like ?", "%#{query}%")
  end

  def last_updated_display
    if self.last_updated.nil?
      self.updated_at
    else
      self.last_updated
    end
  end

end