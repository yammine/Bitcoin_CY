class Price < ActiveRecord::Base

  scope :recent, -> { where([ "created_at > ?", 15.seconds.ago ])}

end
