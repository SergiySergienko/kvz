class Managers::BuildingManager < Managers::Base
  include Managers::Poppulators::BuildingManager
  
  def self.retrieve_entity_for(entity, options={})
  	return unless entity
    if entity.is_a?(User)
      find_or_create_building_for_user(entity, options)
    elsif entity.is_a?(Planet)
      find_or_create_building_for_planet(entity, options)
    end	
  end

  def self.get_entities_for(entity, options={})
  	return [] unless entity
  	if entity.is_a?(User)
      load_buildings_for_user(entity)
    elsif entity.is_a?(Planet)
      load_buildings_for_planet(entity)
    end	
  end

  protected
  
  def self.managed_entity_class_name
  	"Building"
  end


end