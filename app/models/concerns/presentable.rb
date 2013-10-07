module Presentable
  extend ActiveSupport::Concern

  included do |klass|
  	klass.send(:extend, ClassMethods)    
  	klass.send(:include, InstanceMethods)
  	
  end

  module ClassMethods
  	
  end

  module InstanceMethods
  	
    def title
    	I18n.translate "#{translate_key}.title"
  	end

  	def description
    	I18n.translate "#{translate_key}.description"
  	end	

  	def image_url
    	"/images/#{self.class.name.underscore}/#{send("#{self.class.name.underscore}_type").try(:underscore)}.gif"
  	end

    def translate_key
       "#{self.class.name.underscore}.#{send("#{self.class.name.underscore}_type").try(:underscore)}"
    end

  end

end