class Managers::ShipManager < Managers::Base
  include Managers::Poppulators::ShipManager

  def self.retrieve_entity_for(entity, options={})
    return unless entity
    find_or_create_ship_for_planet(entity, options) if entity.is_a?(Planet)
  end

  def self.get_entities_for(entity, options={})
    return [] unless entity
    load_ships_for_planet(entity, options) if entity.is_a?(Planet)
  end

  protected
  
  def self.managed_entity_class_name
  	"Ship"
  end


end