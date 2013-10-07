module Managers::Poppulators
  
  module ShipManager
      
    extend ActiveSupport::Concern

    included do |klass|
      klass.send(:extend, ClassMethods)    
      klass.send(:include, InstanceMethods)
    end

    module ClassMethods

      def find_or_create_ship_for_planet(planet, options={})
        return unless options[:ship_type]
        default_options = {planet_id: planet}
        default_options.merge! options unless options.empty?
        managed_class.try(:where, default_options).try(:first_or_initialize)
      end
      
      #
      # TODO: Refactor this SHIT !!!
      def load_ships_for_planet(planet, options={})
        (EntitiesLoader.get_entities_by_category(managed_entity_class_name.underscore.to_sym).map {|_,v| v} + (managed_class.try(:where, planet_id: planet))).uniq {|item| item.ship_type }
      end
      
    end

    module InstanceMethods
      
    end

  end

end