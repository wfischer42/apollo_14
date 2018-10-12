require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end

  describe 'Instance Methods' do
    it 'can calculate time in space' do
      astronaut = Astronaut.create(name: "Niel Armstrong", age: 47, job: "Moonwalker")
      astronaut.missions.create(title: "Gemini 7", time_in_space: 201)
      astronaut.missions.create(title: "Apollo 13", time_in_space: 381)

      expect(astronaut.time_in_space).to eq(582)
    end
  end
end
