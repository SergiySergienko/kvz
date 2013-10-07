class GameController < ApplicationController
	before_action :auth_required, only: [:index]

	def index
	end

	def signin
	  proceed_auth('asd', 'asd')
	end

	def signout
	  clean_current_user
	  redirect_to root_path
	end

	def signup
	end

end
