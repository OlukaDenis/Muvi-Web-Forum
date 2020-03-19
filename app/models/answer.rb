class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :content, presence: true, length: { maximum: 200,
                                              too_long: '200 characters in comment is the maximum allowed.' }
end
