class Technology < ActiveRecord::Base
  include Presentable
  
  belongs_to :user

  def extend!
    save!
  end

  def c_technology_type
    technology_type.to_s.underscore if technology_type
  end
  
end
