module Authentication
  def login
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
    end
  end
end
