class Game::ShipController < ApplicationController 
  before_filter :poppulate_planet, only: [:list, :build]

  def index
  end

  def list
    @ships = Managers::ShipManager.get_entities_for(@planet)
  end

  def build
    ship = Managers::ShipManager.retrieve_entity_for(@planet, format_options(params))
    ship.extend! if AccessManager.can_call?(:extend!, ship)
    redirect_to game_ship_list_url(:planet_id => @planet)
  end

  protected

  def allowed_options
    [:planet_id, :ship_type]
  end

  private

  def poppulate_planet
    @planet = Managers::PlanetManager.get_entity_for(current_user, params[:planet_id])
  end

  def normallize_option_values(options)
    options[:ship_type] = options[:ship_type].classify.to_s if options[:ship_type]
    options
  end

end
