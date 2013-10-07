class Planet < ActiveRecord::Base
  include Presentations::Planet
  
  belongs_to :user
  has_many :buildings
  


end
