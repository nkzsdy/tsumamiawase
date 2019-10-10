require 'rails_helper'

RSpec.describe 'トップページへのアクセス', type: :request do
  context 'トップページにアクセスしたとき' do
    login

    it '成功ステータスが返ること' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
