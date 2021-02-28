class Subcategorization < ApplicationRecord
  belongs_to :categorization
  has_many :articles
end
