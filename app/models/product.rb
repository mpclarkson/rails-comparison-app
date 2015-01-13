class Product < ActiveRecord::Base
  include ElasticsearchSearchable

  scope :active, -> { where(active: true) }

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

  def currency_price
    if self.currency == 'GBP'
      '£%.2f' % self.search_price.to_s
    else
      '%£%.2f' % (self.currency self.search_price.to_s)
    end
  end

end