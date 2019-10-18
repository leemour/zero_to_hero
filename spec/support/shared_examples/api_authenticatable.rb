shared_examples_for "API authenticatable" do |params={}|
  context 'unauthorized' do
    it 'responds with 401 status if no login & no password' do
      send method, path, params.merge(format: :json)
      expect(response.status).to eq(401)
    end

    it 'responds with 401 status if invalid login' do
      send method, path, params.merge(format: :json, login: 'login', password: 'abc')
      expect(response.status).to eq(401)
    end

    it 'responds with 401 status if invalid password' do
      user = create(:user)
      send method, path, params.merge(format: :json, login: user.login, password: 'abc')
      expect(response.status).to eq(401)
    end
  end
end
