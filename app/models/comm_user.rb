class CommUser < ActiveRecord::Base
  belongs_to :comm
  belongs_to :user
end
