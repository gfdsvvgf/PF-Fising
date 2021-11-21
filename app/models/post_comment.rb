class PostComment < ApplicationRecord
  belongs_to :customer
  belongs_to :list
  
  validates :comment, presence: true
end
