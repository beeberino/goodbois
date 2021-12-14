require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  describe '#index' do
    it 'displays recent dogs' do
      user = create(:user)
      2.times { create(:dog, owner: user) }
      get :index
      expect(assigns(:dogs).size).to eq(2)
    end

    it 'paginates dogs' do
      user = create(:user)
      10.times { create(:dog, owner: user) }
      get :index
      expect(assigns(:dogs).size).to eq(5)
    end
  end
end
