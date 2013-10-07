module NotificationCollector
  extend ActiveSupport::Concern

  included do |klass|
  	klass.send(:extend, ClassMethods)
  	klass.send(:attr_accessor, :n_errors)
  	klass.send(:attr_accessor, :n_infos)

  end

    def self.get_errors
      result = n_errors
      @n_errors = []
      result.flatten.join(", ")
    end

    def self.get_infos
      result = n_infos
      @n_infos = []
      result.flatten.join(", ")
    end

    def self.add_error(message)
      n_errors << message
    end

    def self.add_infos(message)
      n_infos << message
    end 

    module ClassMethods

      def t(key, args={})
        I18n.translate "#{translate_key}.#{key}", args
      end

      def translate_key
        "notification_collector"
      end

    end

    private

    def self.n_errors
  	  @n_errors ||= []
  	end

  	def self.n_infos
  	  @n_infos ||= []
  	end

end