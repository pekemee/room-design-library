class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, length: { maximum: 20 }
  validate  :picture_size
  validates :picture, presence: true

  def make_good(user)
    likes.create(user_id: user.id)
  end

  def delete_good(user)
    likes.find_by(user_id: user.id).destroy
  end

  def good?(user)
    like_users.include?(user)
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
