class AccessListeners::NuclearReactorListener < AccessListeners::Base
   include NotificationCollector
   
   def self.can_block_action_for?(entity, method)
     return false unless entity
     return false unless entity.is_a?(Building)
     return false if entity.building_type != 'NuclearReactior'
     true
   end

   def self.is_can_call_extend!(entity)
     gaz_mine = Managers::BuildingManager.retrieve_entity_for(entity.planet, building_type: 'GazMine')     
     NotificationCollector.add_error(t("errors.building_required", :title => gaz_mine.title, :level => 5)) and return false if gaz_mine.new_record?
     energy_tech = Managers::TechnologyManager.retrieve_entity_for(entity.user, technology_type: 'EnergyTechnology')     
     NotificationCollector.add_error(t("errors.technology_required", :title => energy_tech.title, :level => 5)) and return false if energy_tech.new_record?
     true
   end

   def self.translate_key
     "#{super}.building_listener"
   end

end