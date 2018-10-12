class AstronautsController < ApplicationController
  def index
    @astronauts_missions = Astronaut.all.inject({}) do |missions, astronaut|
      missions[astronaut] = astronaut.missions.order(:title)
      missions
    end
    @avg_age = Astronaut.average(:age).to_f.round(1)
  end
end
