class AccessListeners::AttackLightShipListener < AccessListeners::Base
  include NotificationCollector
   
  def self.can_block_action_for?(entity, method)
   return false unless entity.present?
   return false unless entity.is_a?(Ship)
   return false if entity.ship_type != 'AttackLightShip'
   true
  end

  def self.is_can_call_extend!(entity)
   ship_yard = Managers::BuildingManager.retrieve_entity_for(entity.planet, building_type: 'ShipYard')     
   NotificationCollector.add_error(t("errors.building_required", :title => ship_yard.title, :level => 999)) and return false if ship_yard.new_record?
   true
  end

   def self.translate_key
     "#{super}.building_listener"
   end

end