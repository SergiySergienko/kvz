class Managers::PlanetManager < Managers::Base
  
  def self.retrieve_entity_for(user)
    return unless user
    managed_class.try(:where, user_id: user).try(:first_or_initialize)
  end

  def self.get_entities_for(user)
  	return [] unless user
 	  managed_class.try(:where, user_id: user)
  end

  protected
  
  def self.managed_entity_class_name
  	"Planet"
  end

end