class Bird < ActiveRecord::Base
  def sing
    PingService.song
  end
end
