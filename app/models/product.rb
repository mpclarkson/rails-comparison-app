class Product < ActiveRecord::Base

  include SearchableModel

  # Move this to searchable model
  def self.search(query)
    where("description like ?", "%#{query}%")
  end

  is_impressionable counter_cache: true, column_name: :page_views

  has_and_belongs_to_many :categories
  belongs_to :affiliate_program
  belongs_to :merchant
  belongs_to :brand

  def last_updated_display
    if self.last_updated.nil?
      self.updated_at
    else
      self.last_updated
    end
  end

end