class EntitiesLoader
  attr_accessor :instance
  
  def self.instance
  	@instance ||= EntitiesLoader.new
  end

  def initialize
  	load_all
  	instance
  end

  def self.all_entities
  	instance.all_entities
  end

  def self.all_entities_keys
  	instance.all_entities_keys
  end



  def self.get_entities_by_category(category)
  	instance.all_entities[category] || {}
  end

  def self.get_entitiy_by_key(key)
  	instance.all_entities_keys[key] || nil
  end

  

  def all_entities
  	@all_entities
  end

  def all_entities_keys
  	@all_entities_keys
  end

  private

  def load_all
  	@all_entities ||= {}
  	@all_entities_keys ||= {}
  	load_data.each do |category, items|
  	  @all_entities[category] ||= {}
  	  items.each do |i_class_name, i_values|
  	  	c_instance = category.to_s.classify.constantize.new("#{category}_type".to_sym => i_class_name.to_s)
  	  	@all_entities[category][i_class_name.to_s.underscore.to_sym] = c_instance
  	  	@all_entities_keys[i_class_name.to_s.underscore.to_sym] = c_instance
  	  end
  	end
  end

  def load_data
  	result = {}
  	Dir[Rails.root.join('lib', 'entities_configs', '*.yml').to_s].each do |f_name|	
  	  result.merge!(YAML.load(File.read(f_name)))
  	end
  	result
  end

end