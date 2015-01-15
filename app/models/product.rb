class Product < ActiveRecord::Base
  scope :active, -> { where(active: true) }
  is_impressionable counter_cache: true, column_name: :page_views
  has_and_belongs_to_many :categories
  belongs_to :affiliate_program
  belongs_to :merchant
  belongs_to :brand

  # include ElasticsearchSearchable ##this has been replaced by searchkick
  searchkick text_start: [:product_name], autocomplete: ['product_name']

  def search_data
    as_json(only: [:product_name, :description, :keywords, :search_price, :currency, :active]).merge(brand: brand.name).merge(merchant: merchant.name)
  end

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
      '%$%.2f' % (self.currency self.search_price.to_s)
    end
  end

end