class Game::PlanetController < ApplicationController
  before_action :auth_required

  def index
  	@planets = Managers::PlanetManager.get_entities_for(current_user)
  end

  def show
  	@planet = Managers::PlanetManager.get_entity_for(current_user, params[:planet_id])
    redirect_to :action => :index unless @planet
  end

end
