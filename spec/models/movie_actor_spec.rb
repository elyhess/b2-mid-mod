require 'rails_helper'

RSpec.describe MovieActor, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it {should belong_to :movie}
    it {should belong_to :actor}
  end

  describe 'instance methods' do
  end

  describe 'class methods' do 
  end
  
end
