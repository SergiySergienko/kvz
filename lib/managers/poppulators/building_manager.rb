module Managers::Poppulators
	
	module BuildingManager
  	  
  	  extend ActiveSupport::Concern

	  included do |klass|
	  	klass.send(:extend, ClassMethods)    
	  	klass.send(:include, InstanceMethods)
	  end

	  module ClassMethods

      def find_or_create_building_for_user(user, options={})
        return unless options[:building_type]
        default_options = {user_id: user}
        default_options.merge! options unless options.empty?
        managed_class.try(:where, default_options).try(:first_or_initialize)
      end

      def find_or_create_building_for_planet(planet, options={})
        return unless options[:building_type]
        default_options = {planet_id: planet}
        default_options.merge! options unless options.empty?
        managed_class.try(:where, default_options).try(:first_or_initialize)
      end
	  	
	  	#
      # TODO: Refactor this SHIT !!!
      def load_buildings_for_planet(planet)
	  	  (EntitiesLoader.get_entities_by_category(managed_entity_class_name.underscore.to_sym).map {|_,v| v} + (managed_class.try(:where, planet_id: planet))).uniq {|item| item.building_type }
	  	end

	  	def load_buildings_for_user(user)
	  	  managed_class.try(:where, user_id: user)
	  	end
		  
	  end

	  module InstanceMethods
	  	
	  end

	end

end