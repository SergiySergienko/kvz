module User::Planets
 extend ActiveSupport::Concern 

  included do |klass|
    after_create :assign_planet
  end

  private

  def assign_planet
	planet = Managers::PlanetManager.retrieve_entity_for(self)
	planet.try(:save!) if planet.new_record?
  end

end