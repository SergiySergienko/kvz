module User::Associations
  extend ActiveSupport::Concern

  included do
    has_many :planets, :dependent => :destroy
  end


end