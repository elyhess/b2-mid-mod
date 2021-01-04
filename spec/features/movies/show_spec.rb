require "rails_helper"

describe "As a visitor" do
  describe "when i visit the movie show page" do
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

    it "I see the movies attributes, as well as the actors from youngest to oldest. I also see the average age" do
      visit movie_path(@midsommar)
      save_and_open_page
      expect(page).to have_content(@midsommar.title)
      expect(page).to have_content(@midsommar.year)
      expect(page).to have_content(@midsommar.genre)

      within("#actors") do
        expect(page).to have_content("Average age: #{Actor.average_age}") 
        expect(page).to have_content("Actors:")
        expect(@actor_3).to appear_before(@actor_1)
        expect(@actor_1).to appear_before(@actor_2)
      end
    end
  end
end