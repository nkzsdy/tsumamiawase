require 'rails_helper'

RSpec.describe Seasoning, type: :model do
  describe 'バリデーション' do
    let(:user) { FactoryBot.create(:user) }

    context '正常系' do
      context 'user_id, nameがどちらも入力されているとき'
        it '登録できること' do
          seasoning = Seasoning.new(user_id: user.id, name: "sample_seasoning")
          expect(seasoning).to be_valid
        end
    end

    context '異常系' do
      context 'user_idだけが入力されていないとき' do
        it '登録できないこと' do
          seasoning = Seasoning.new(name: "sample_seasoning")
          expect(seasoning).to be_invalid
        end
      end

      context 'nameだけが入力されていないとき' do
        it '登録できないこと' do
          seasoning = Seasoning.new(user_id: user.id)
          expect(seasoning).to be_invalid
        end
      end

      context 'user_id, nameがどちらも入力されていないとき' do
        it '登録できないこと' do
          seasoning = Seasoning.new
          expect(seasoning).to be_invalid
        end
      end

      context 'user_idとnameの組み合わせがすでに存在するとき' do
        before do
          FactoryBot.create(:seasoning,
                            user_id: user.id,
                            name: "sample_seasoning")
        end

        it '登録できないこと' do
          seasoning = Seasoning.new(user_id: user.id, name: "sample_seasoning")
          expect(seasoning).to be_invalid
        end
      end
    end
  end
end
