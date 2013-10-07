class AccessManager
  include NotificationCollector
  
  def self.can_call?(method, entity)
    results = []
    all_listeners.each do |l_klass|
      results << l_klass.constantize.send("can_call_method_for?", entity, method) if l_klass.constantize.can_block_action_for?(entity, method)
    end
    puts results.inspect
    return false if results.any? { |val| val == false }
    true
  end

  protected

  def self.all_listeners
  	[
  		"AccessListeners::BuildingListener", "AccessListeners::TestTechnologyListener",
      "AccessListeners::NuclearReactorListener"
  	]
  end

end