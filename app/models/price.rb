class Price < ActiveRecord::Base

  scope :recent, -> { where([ "time > ?", 14.seconds.ago ])}



end
