require 'rails_helper'

RSpec.describe Studio, type: :model do
  describe 'validations' do

  end

  describe 'relationships' do
    it {should have_many :movies}
  end

  describe 'instance methods' do
  end

  describe 'class methods' do 
  end
  
end
