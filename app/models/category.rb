class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '車' },
    { id: 3, name: 'バイク' },
    { id: 4, name: '自転車' },
    { id: 5, name: '徒歩' },
    { id: 6, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :photograph
end
