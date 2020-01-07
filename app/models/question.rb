class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5}
end
