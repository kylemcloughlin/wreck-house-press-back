class Categorization < ApplicationRecord
  has_many :articles
  has_many :subcategorizations
end
