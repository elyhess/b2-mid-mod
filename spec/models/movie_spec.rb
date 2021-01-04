require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many :actors}
  end

  describe 'instance methods' do
  end

  describe 'class methods' do 
  end
  
end
