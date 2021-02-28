class Article < ApplicationRecord
  belongs_to :categorization
  belongs_to :subcategorization
end
