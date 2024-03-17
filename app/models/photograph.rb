class Photograph < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
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

  def self.search(search)
    if search != ""
      Photograph.where('description LIKE(?)', "%#{search}%").
        or(where('title LIKE(?)', "%#{search}%"))
    else
      Photograph.all
    end
  end

end
