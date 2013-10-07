class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authorization

  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end

  def format_options(options)
    result = {}
    options.each do |key, value|
      result[key.to_sym] = value if allowed_options.include? key.to_sym
    end
    normallize_option_values(result)
  end

  protected

  def allowed_options
    []
  end

  def normallize_option_values(options)
    options
  end

end
