require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    photograph = FactoryBot.create(:photograph)
    @comment = FactoryBot.build(:comment, user_id: user.id, photograph_id: photograph.id)
    sleep 0.1
  end

  describe 'コメント機能の保存' do
    context '内容に問題ない場合' do
      it "コメント文が入力されていれば保存できること" do
        expect(@comment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "コメントが空では登録できない" do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it "userが紐付いていなければコメントできないこと" do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it "投稿したものがなければコメントできないこと" do
        @comment.photograph_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Photograph must exist")
      end
    end
  end
end
