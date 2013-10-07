class Managers::Base
  
  def self.retrieve_entity_for(entity, options={})
    raise "#{self.class.to_s} method retrieve_entity_for should be owerrided !!"
  end

  def self.get_entity_for(entity, entity_id=nil)
    entity_id ? get_entities_for(entity).where(id: entity_id).first : retrieve_entity_for(entity)
  end

  def self.get_entities_for(entity, options={})
  	raise "#{self.class.to_s} method retrieve_entities_for should be owerrided !!"
  end

  protected

  def self.managed_class
    managed_entity_class_name.constantize
  end
  
  def self.managed_entity_class_name
  	raise "#{self.class.to_s} method managed_entity_class_name should be owerrided !!"
  end

end