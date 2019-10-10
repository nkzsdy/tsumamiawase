require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    context '正常系' do
      context 'メールアドレスとパスワードがどちらも入力されているとき' do
        it '登録できること' do
          user = User.new(email: "hoge@fuga.com", password: "hogefuga")
          expect(user).to be_valid
        end
      end
    end

    context '異常系' do
      context 'メールアドレスだけが入力されていないとき' do
        it '登録できないこと' do
          user = User.new(password: "hogefuga")
          expect(user).to be_invalid
        end
      end

      context 'パスワードだけが入力されていないとき' do
        it '登録できないこと' do
          user = User.new(email: "hoge@fuga.com")
          expect(user).to be_invalid
        end
      end

      context 'メールアドレスとパスワードがどちらも入力されていないとき' do
        it '登録できないこと' do
          user = User.new
          expect(user).to be_invalid
        end
      end
    end
  end
end
