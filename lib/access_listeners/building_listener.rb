class AccessListeners::BuildingListener < AccessListeners::Base
   include NotificationCollector
   
   def self.can_block_action_for?(entity, method)
   	 return false unless entity
   	 return false unless entity.is_a?(Building)
   	 true
   end

   def self.is_can_call_extend!(entity)
   	 NotificationCollector.add_error(t("errors.cant_proceed")) and return false unless entity.new_record?
   	 true
   end

   def self.translate_key
     "#{super}.building_listener"
   end

end