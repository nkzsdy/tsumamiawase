require 'rails_helper'

RSpec.describe '調味料の管理', type: :request do
  login

  let!(:seasoning) { FactoryBot.create(:seasoning, user_id: user.id, name: "delete_target_seasoning") }

  context '調味料の管理ページにアクセスしたとき' do
    it '成功ステータスが返ること' do
      get '/seasonings'
      expect(response).to have_http_status(:success)
    end
  end

  context '調味料を追加したとき' do
    it '追加した名前の調味料が存在すること' do
      post "/seasonings", params: { seasoning: { user_id: user.id, name: "added_seasoning" } }
      expect(Seasoning.exists?(name: "added_seasoning")).to be_truthy
    end
  end

  context '調味料を削除したとき' do
    it '削除対象の調味料が存在しないこと' do
      expect(Seasoning.exists?(name: seasoning.name)).to be_truthy
      delete "/seasonings/#{seasoning.id}"
      expect(Seasoning.exists?(name: seasoning.name)).to be_falsy
    end
  end
end
