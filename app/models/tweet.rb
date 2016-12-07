class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy

  mount_uploader :image, ImageUploader

  acts_as_ordered_taggable_on :interests

  def favorited_by? user
  favorites.where(user_id: user.id).exists?
  end

end
