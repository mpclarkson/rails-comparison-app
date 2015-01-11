class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :affiliate_program
  belongs_to :merchant
  belongs_to :brand
end