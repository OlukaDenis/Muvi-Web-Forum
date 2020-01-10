class Question < ApplicationRecord
  has_many :answers
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5}
end
