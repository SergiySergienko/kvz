class User < ActiveRecord::Base
  include User::Associations
  include User::Planets

end
