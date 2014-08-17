class Price < ActiveRecord::Base


  DEFAULT_TIMEOUT = 10

  scope :recent, -> { where([ "time > ?", 14.seconds.ago ])}



end
