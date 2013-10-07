class AccessListeners::Base

   def self.can_block_action_for?(entity, method)
   	 raise "Should be owerrided in each listener"
   end

   def self.can_call_method_for?(entity, method)
   	 send("is_can_call_#{method}", entity) if respond_to?("is_can_call_#{method}")
   end

end