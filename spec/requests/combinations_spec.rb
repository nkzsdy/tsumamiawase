require 'rails_helper'

RSpec.describe 'かけあわせ機能', type: :request do
  login

  let!(:ingredient) { FactoryBot.create(:ingredient, user_id: user.id) }
  let!(:seasoning) { FactoryBot.create(:seasoning, user_id: user.id) }
  let!(:combination) { FactoryBot.create(:combination,
                    user_id: user.id,
                    ingredient_id: ingredient.id,
                    seasoning_id: seasoning.id) }

  context 'かけあわせの作成ページにアクセスしたとき' do
    it '成功ステータスが返ること' do
      get '/combinations/new'
      expect(response).to have_http_status(:success)
    end
  end

  context 'かけあわせの変更ページにアクセスしたとき' do
    it '成功ステータスが返ること' do
      get '/combinations/new'
      expect(response).to have_http_status(:success)
    end
  end

  context 'かけあわせを削除したとき' do
    it 'トップページに遷移すること' do
      delete "/combinations/#{combination.id}"
      expect(response).to redirect_to("/")
    end
  end
end
