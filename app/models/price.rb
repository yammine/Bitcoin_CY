class Price < ActiveRecord::Base

  scope :recent, -> { where([ "created_at > ?", 10.seconds.ago ])}

end
