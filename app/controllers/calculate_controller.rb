class CalculateController < ApplicationController
  def crunch
    device_name         = params["device"]["name"]
    motion_hour         = params["motion"]["hour"]
    motion_minute       = params["motion"]["minute"]
    stationary_hour     = params["stationary"]["hour"]
    stationary_minute   = params["stationary"]["minute"]
    tim                 = params["tim"]["percent"]
    hibernation_enabled = params["hibernate"].nil? ? false : true
    render :layout => false
  end
end
