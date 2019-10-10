require 'rails_helper'

RSpec.describe '未ログイン時のページ遷移', type: :request do
  context 'トップページにアクセスしたとき' do
    it 'ログインページに遷移すること' do
      get '/'
      expect(response).to redirect_to('http://www.example.com/users/sign_in')
    end
  end

  context 'かけあわせの作成ページにアクセスしたとき' do
    it 'ログインページに遷移すること' do
      get '/combinations/new'
      expect(response).to redirect_to('http://www.example.com/users/sign_in')
    end
  end

  context 'かけあわせの変更ページにアクセスしたとき' do
    it 'ログインページに遷移すること' do
      get '/combinations/:id/edit'
      expect(response).to redirect_to('http://www.example.com/users/sign_in')
    end
  end

  context 'つまみの管理ページにアクセスしたとき' do
    it 'ログインページに遷移すること' do
      get '/ingredients'
      expect(response).to redirect_to('http://www.example.com/users/sign_in')
    end
  end

  context '調味料の管理ページにアクセスしたとき' do
    it 'ログインページに遷移すること' do
      get '/seasonings'
      expect(response).to redirect_to('http://www.example.com/users/sign_in')
    end
  end
end
