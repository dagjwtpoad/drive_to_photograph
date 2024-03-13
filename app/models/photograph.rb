class Photograph < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture

  with_options presence: true do
    validates :title
    validates :category_id
    validates :prefecture_id
    validates :description
    validates :image
  end

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

end
