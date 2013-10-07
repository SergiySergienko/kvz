class Managers::TechnologyManager < Managers::Base
  include Managers::Poppulators::TechnologyManager
  
  def self.retrieve_entity_for(entity, options={})
    return unless entity
    find_or_create_technology_for_user(entity, options) if entity.is_a?(User)
  end

  def self.get_entities_for(entity, options={})
    return [] unless entity
    load_technologies_for_user(entity, options) if entity.is_a?(User)
  end

  protected
  
  def self.managed_entity_class_name
  	"Technology"
  end

end