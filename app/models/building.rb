class Building < ActiveRecord::Base
  include NotificationCollector
  include Presentable
  belongs_to :user
  belongs_to :planet

  def extend!
    NotificationCollector.add_infos(Building.t("infos.success"))
    save!
  end

  def c_building_type
    building_type.to_s.underscore if building_type
  end

  def self.translate_key
     "#{super}.building_listener"
   end

  
end
