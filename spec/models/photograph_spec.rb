require 'rails_helper'

RSpec.describe Photograph, type: :model do
  before do
    @photograph = FactoryBot.build(:photograph)
  end

  describe '新規投稿の入力' do
    context '情報の保存ができる場合' do
      it '全ての入力が完了している' do
        expect(@photograph).to be_valid
      end
    end

    context '情報の保存ができない場合' do
      it 'userが紐付いていないと保存できない' do
        @photograph.user = nil
        @photograph.valid?
        expect(@photograph.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では登録できない' do
        @photograph.image = nil
        @photograph.valid?
        expect(@photograph.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        @photograph.title = ''
        @photograph.valid?
        expect(@photograph.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @photograph.description = ''
        @photograph.valid?
        expect(@photograph.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが"--"では登録できない' do
        @photograph.category_id = 1
        @photograph.valid?
        expect(@photograph.errors.full_messages).to include('Category must be other than 1')
      end
      it 'prefecture_idが"--"では登録できない' do
        @photograph.prefecture_id = 1
        @photograph.valid?
        expect(@photograph.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'addressが空では登録できない' do
        @photograph.address = ''
        @photograph.valid?
        expect(@photograph.errors.full_messages).to include("Address can't be blank")
      end
    end
  end
end
