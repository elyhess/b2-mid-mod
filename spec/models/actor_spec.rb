require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'validations' do

  end

  describe 'relationships' do
    it {should have_many :movie_actors}
    it {should have_many :movies}
  end

  describe 'instance methods' do
  end

  describe 'class methods' do 
  end
  
end
