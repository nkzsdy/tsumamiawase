require 'rails_helper'

RSpec.describe Combination, type: :model do
  describe 'バリデーション' do
    let(:user) { FactoryBot.create(:user) }
    let(:ingredient) { FactoryBot.create(:ingredient, user_id: user.id) }
    let(:seasoning) { FactoryBot.create(:seasoning, user_id: user.id) }

    context '正常系' do
      context 'user_id, ingredient_id, seasoning_idがすべて入力されているとき' do
        it '登録できること' do
          combination = Combination.new(user_id: user.id,
                                        ingredient_id: ingredient.id,
                                        seasoning_id: seasoning.id)
          expect(combination).to be_valid
        end
      end
    end

    context '異常系' do
      context 'user_idだけが入力されていないとき' do
        it '登録できないこと' do
          combination = Combination.new(ingredient_id: ingredient.id,
                                        seasoning_id: seasoning.id)
          expect(combination).to be_invalid
        end
      end

      context 'ingredient_idだけが入力されていないとき' do
        it '登録できないこと' do
          combination = Combination.new(user_id: user.id,
                                        seasoning_id: seasoning.id)
          expect(combination).to be_invalid
        end
      end

      context 'seasoning_idだけが入力されていないとき' do
        it '登録できないこと' do
          combination = Combination.new(user_id: user.id,
                                        ingredient_id: ingredient.id)
          expect(combination).to be_invalid
        end
      end

      context 'user_idとingredient_idが入力されていないとき' do
        it '登録できないこと' do
          combination = Combination.new(seasoning_id: seasoning.id)
          expect(combination).to be_invalid
        end
      end

      context 'user_idとseasoning_idが入力されていないとき' do
        it '登録できないこと' do
          combination = Combination.new(ingredient_id: ingredient.id)
          expect(combination).to be_invalid
        end
      end

      context 'ingredient_idとseasoning_idが入力されていないとき' do
        it '登録できないこと' do
          combination = Combination.new(user_id: user.id)
          expect(combination).to be_invalid
        end
      end

      context 'user_id, ingredient_id, seasoning_idがすべて入力されていないとき' do
        it '登録できないこと' do
          combination = Combination.new
          expect(combination).to be_invalid
        end
      end

      context 'user_id, ingredient_id, seasoning_idの組み合わせがすでに存在するとき' do
        before do
          FactoryBot.create(:combination,
                            user_id: user.id,
                            ingredient_id: ingredient.id,
                            seasoning_id: seasoning.id
                           )
        end

        it '登録できないこと' do
          combination = Combination.new(user_id: user.id,
                                        ingredient_id: ingredient.id,
                                        seasoning_id: seasoning.id)
          expect(combination).to be_invalid
        end
      end
    end
  end
end
