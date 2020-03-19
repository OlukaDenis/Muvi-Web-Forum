class Question < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  # mount_uploader :picture, PictureUploader
  has_many :answers, dependent: :destroy
  validates :user_id, presence: true
  validates :body, presence: true, length: { in: 10..255}
  # validate picture_size

  scope :ordered_most_recent, -> { order(created_at: :desc).last(10) }

  private
  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
