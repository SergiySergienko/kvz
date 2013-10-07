class Ship < ActiveRecord::Base
  include Presentable

  belongs_to :user
  belongs_to :planet

  def extend!
    save!
  end

  def c_ship_type
    ship_type.to_s.underscore if ship_type
  end
  
end
