class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '晴れ' },
    { id: 3, name: '曇り' },
    { id: 4, name: '雨' },
    { id: 5, name: '霧' },
    { id: 6, name: '雪' },
    { id: 7, name: '朝日' },
    { id: 8, name: '夕日' },
    { id: 9, name: '夜景' },
    { id: 10, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :photograph
end
