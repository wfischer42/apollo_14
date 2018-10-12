require 'rails_helper'

describe 'When a user visits' do
  describe 'the astronaut index' do
    before(:each) do
      astronaut_1 = Astronaut.create(name: "Niel Armstrong", age: 47, job: "Moonwalker")
      astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 41, job: "Space Golfer")
      astronaut_3 = Astronaut.create(name: "Mark Watney", age: 39, job: "Botanist")

      astronaut_1.missions.create(title: "Gemini 7", time_in_space: 201)
      astronaut_1.missions.create(title: "Apollo 13", time_in_space: 381)
      astronaut_1.missions.create(title: "Capricorn 4", time_in_space: 128)
      astronaut_2.missions.create(title: "Ares 2", time_in_space: 101)
      astronaut_2.missions.create(title: "Apollo 13", time_in_space: 381)
      astronaut_3.missions.create(title: "Ares 3", time_in_space: 812)
    end
    it 'shows user list of astronauts with personal info' do
      visit astronauts_path

      expect(page).to have_content("Astronauts")
      expect(all('.astronaut-card')[0]).to have_content("Niel Armstrong")
      expect(all('.astronaut-card')[0]).to have_content("47")
      expect(all('.astronaut-card')[0]).to have_content("Moonwalker")
      expect(all('.astronaut-card')[1]).to have_content("Buzz Aldrin")
      expect(all('.astronaut-card')[1]).to have_content("41")
      expect(all('.astronaut-card')[1]).to have_content("Space Golfer")
    end
    it 'shows user average age of astronauts' do
      visit astronauts_path

      expect(page).to have_content("Average Age: 42.3")
    end
    it 'shows an ordered list of space missions for each astronaut' do
      visit astronauts_path

      within all('.astronaut-card')[0] do
        expect(all('.mission')[0]).to have_content('Apollo 13')
        expect(all('.mission')[1]).to have_content('Capricorn 4')
        expect(all('.mission')[2]).to have_content('Gemini 7')
      end
      within all('.astronaut-card')[1] do
        expect(all('.mission')[0]).to have_content('Apollo 13')
        expect(all('.mission')[1]).to have_content('Ares 2')
      end
    end
    it 'shows the total time in space for each astronaut' do
      visit astronauts_path

      expect(all('.astronaut-card')[0]).to have_content('Time in Space: 710')
      expect(all('.astronaut-card')[1]).to have_content('Time in Space: 482')
      expect(all('.astronaut-card')[2]).to have_content('Time in Space: 812')
    end
  end
end
