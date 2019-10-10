require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'バリデーション' do
    let(:user) { FactoryBot.create(:user) }

    context '正常系' do
      context 'user_id, nameがどちらも入力されているとき'
        it '登録できること' do
          ingredient = Ingredient.new(user_id: user.id, name: "sample_ingredient")
          expect(ingredient).to be_valid
        end
    end

    context '異常系' do
      context 'user_idだけが入力されていないとき' do
        it '登録できないこと' do
          ingredient = Ingredient.new(name: "sample_ingredient")
          expect(ingredient).to be_invalid
        end
      end

      context 'nameだけが入力されていないとき' do
        it '登録できないこと' do
          ingredient = Ingredient.new(user_id: user.id)
          expect(ingredient).to be_invalid
        end
      end

      context 'user_id, nameがどちらも入力されていないとき' do
        it '登録できないこと' do
          ingredient = Ingredient.new
          expect(ingredient).to be_invalid
        end
      end

      context 'user_idとnameの組み合わせがすでに存在するとき' do
        before do
          FactoryBot.create(:ingredient,
                            user_id: user.id,
                            name: "sample_ingredient")
        end

        it '登録できないこと' do
          ingredient = Ingredient.new(user_id: user.id, name: "sample_ingredient")
          expect(ingredient).to be_invalid
        end
      end
    end
  end
end
