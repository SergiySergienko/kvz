class Managers::ShipManager < Managers::Base
  
  def self.retrieve_entity_for(entity)
  	return unless entity
    if entity.is_a?(User)
      managed_class.try(:where, user_id: entity).try(:first_or_initialize)
    elsif entity.is_a?(Planet)
      managed_class.try(:where, planet_id: entity).try(:first_or_initialize)
    end	
  end

  def self.get_entities_for(entity)
  	return [] unless entity
 	if entity.is_a?(User)
      managed_class.try(:where, user_id: entity)
    elsif entity.is_a?(Planet)
      managed_class.try(:where, planet_id: entity)
    end	
  end

  protected
  
  def self.managed_entity_class_name
  	"Ship"
  end


end