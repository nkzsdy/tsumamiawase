require 'rails_helper'

RSpec.describe 'つまみの管理', type: :request do
  login

  let!(:ingredient) { FactoryBot.create(:ingredient, user_id: user.id, name: "delete_target_ingredient") }

  context 'つまみの管理ページにアクセスしたとき' do
    it '成功ステータスが返ること' do
      get '/ingredients'
      expect(response).to have_http_status(:success)
    end
  end

  context 'つまみを追加したとき' do
    it '追加した名前のつまみが存在すること' do
      post "/ingredients", params: { ingredient: { user_id: user.id, name: "added_ingredient" } }
      expect(Ingredient.exists?(name: "added_ingredient")).to be_truthy
    end
  end

  context 'つまみを削除したとき' do
    it '削除対象のつまみが存在しないこと' do
      expect(Ingredient.exists?(name: ingredient.name)).to be_truthy
      delete "/ingredients/#{ingredient.id}"
      expect(Ingredient.exists?(name: ingredient.name)).to be_falsy
    end
  end
end
