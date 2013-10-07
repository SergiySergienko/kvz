module Managable
  extend ActiveSupport::Concern

  included do |klass|
  	klass.send(:extend, ClassMethods)    
  	klass.send(:include, InstanceMethods)
  end

  module ClassMethods
  end

  module InstanceMethods
  end

end