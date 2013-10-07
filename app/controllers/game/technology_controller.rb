class Game::TechnologyController < ApplicationController

  # before_action :populate_building, only: [:show]

  def index
  end

  def list
    @technologies = Managers::TechnologyManager.get_entities_for(current_user)
  end

  def build
    technology = Managers::TechnologyManager.retrieve_entity_for(current_user, format_options(params))
    technology.extend! if AccessManager.can_call?(:extend!, technology)
    redirect_to game_technology_list_url
  end

  protected

  def allowed_options
    [:technology_type]
  end

  private

  # def populate_building
  #   @building = Managers::TechnologyManager.get_entity_for(current_user, params[:building_id])
  # end

  def normallize_option_values(options)
    options[:technology_type] = options[:technology_type].classify.to_s if options[:technology_type]
    options
  end


end
