class Comm < ActiveRecord::Base
  has_many :comm_user
  has_many :user, :through => :comm_user
end
