module Managers::Poppulators
  
  module TechnologyManager
      
    extend ActiveSupport::Concern

    included do |klass|
      klass.send(:extend, ClassMethods)    
      klass.send(:include, InstanceMethods)
    end

    module ClassMethods

      def find_or_create_technology_for_user(user, options={})
        return unless options[:technology_type]
        default_options = {user_id: user}
        default_options.merge! options unless options.empty?
        managed_class.try(:where, default_options).try(:first_or_initialize)
      end

      def load_technologies_for_user(user, options={})
        (EntitiesLoader.get_entities_by_category(managed_entity_class_name.underscore.to_sym).map {|_,v| v} + (managed_class.try(:where, user_id: user))).uniq {|item| item.technology_type }
      end
      
    end

    module InstanceMethods
      
    end

  end

end