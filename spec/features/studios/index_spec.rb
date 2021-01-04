require "rails_helper"

describe "As a visitor" do
  describe "when i visit the studio index page" do
    before :each do
      @a24 = Studio.create!(name: "A24", location: "New York")

      @pixar = Studio.create!(name: 'pixar', location: 'California')
      @soul = @pixar.movies.create!(title: 'Soul', year: "2020", genre: "Animated Comedy")
      @cars = @pixar.movies.create!(title: 'Cars', year: "2006", genre: "Animated Comedy")

      @midsommar = @a24.movies.create!(title: "Midsommar", year: "2019", genre: "Psychological Thriller")
      @hereditary = @a24.movies.create!(title: "Hereditary", year: "2018", genre: "Psychological Thriller")
      @the_lighthouse = @a24.movies.create!(title: "The Lighthouse", year: "2019", genre: "Horror/Drama")

      @actor_1 = Actor.create!(name: "Amy", age: 24)
      @actor_2 = Actor.create!(name: "Bob", age: 43)
      @actor_3 = Actor.create!(name: "Carl", age: 16)
      @actor_4 = Actor.create!(name: "Deandra", age: 33)

      MovieActor.create!(movie: @midsommar, actor: @actor_1)
      MovieActor.create!(movie: @midsommar, actor: @actor_2)
      MovieActor.create!(movie: @midsommar, actor: @actor_3)
      MovieActor.create!(movie: @hereditary, actor: @actor_3)
      MovieActor.create!(movie: @the_lighthouse, actor: @actor_3)
      MovieActor.create!(movie: @the_lighthouse, actor: @actor_1)
      MovieActor.create!(movie: @the_lighthouse, actor: @actor_4)
    end

    it "I see each studio with the movies for each studio underneath" do
      visit studios_path
      expect(page).to have_content("Studios")
      save_and_open_page
      within("#studio-#{@a24.id}") do
        expect(page).to have_content("#{@a24.name} Movies")
        expect(page).to have_content(@midsommar.title) 
        expect(page).to have_content(@hereditary.title) 
        expect(page).to have_content(@the_lighthouse.title) 
      end

      within("#studio-#{@pixar.id}") do
        expect(page).to have_content("#{@pixar.name} Movies")
        expect(page).to have_content(@soul.title) 
        expect(page).to have_content(@cars.title) 
      end
    end

    it 'does something' do
      
    end
  end
end