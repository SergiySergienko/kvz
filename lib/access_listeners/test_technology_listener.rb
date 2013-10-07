class AccessListeners::TestTechnologyListener < AccessListeners::Base
  include NotificationCollector
   
   def self.can_block_action_for?(entity, method)
   	 return false unless entity.present?
   	 return false unless entity.is_a?(Technology)
     return false if entity.technology_type != 'TestTechnology'
   	 true
   end

   def self.is_can_call_extend!(entity)
   	 NotificationCollector.add_infos(t("infos.success"))
   	 false
   end

   def self.translate_key
     "#{super}.test_technology_listener"
   end

end