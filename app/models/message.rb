class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :content, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
  has_one_attached :image
end
