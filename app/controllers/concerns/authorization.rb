module Authorization
  extend ActiveSupport::Concern
  require 'uri'

  included do |klass|
  	klass.send(:include, InstanceMethods)
  	klass.send(:extend, ClassMethods)
  	before_action :current_user
  end

  module ClassMethods

  end

  module InstanceMethods
  	
  	def current_user
  	  @current_user ||= session[:current_user]
  	end

  	def auth_required
  	  redirect_to signin_path(:back_url => current_url) unless current_user.present?
  	end

    def proceed_auth(login, password)
      user = User.first
      back = params[:back_url] || root_path
      set_current_user_with(user) and redirect_to back if user
    end

    def clean_current_user
      session[:current_user] = nil
    end

    def set_current_user_with(user)
      session[:current_user] = user
    end


  end

end