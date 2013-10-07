class Game::BuildingController < ApplicationController
	before_action :populate_building, only: [:show]

	def index
	end

	def list
	  @planet = Managers::PlanetManager.get_entity_for(current_user, params[:planet_id])
	  @buildings = Managers::BuildingManager.get_entities_for(@planet)
	end

	def build
		building = Managers::BuildingManager.retrieve_entity_for(current_user, format_options(params))
	  building.extend! if AccessManager.can_call?(:extend!, building)
	  redirect_to game_building_list_url(:building_id => building.planet)
	end

	protected

	def allowed_options
		[:planet_id, :building_type]
	end

	private

	def populate_building
	  @building = Managers::BuildingManager.get_entity_for(current_user, params[:building_id])
	end

	def normallize_option_values(options)
		options[:building_type] = options[:building_type].classify.to_s if options[:building_type]
		options
	end

end
