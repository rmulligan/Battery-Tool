class CalculateController < ApplicationController
  def crunch
    device_name         = params["device"]["name"]
    motion_hour         = params["motion"]["hour"]
    motion_minute       = params["motion"]["minute"]
    stationary_hour     = params["stationary"]["hour"]
    stationary_minute   = params["stationary"]["minute"]
    tim                 = params["tim"]["percent"].to_f
    hibernation_enabled = params["hibernate"].nil? ? false : true

    if hibernation_enabled == true
      motion_to_min      = to_min(motion_hour,motion_minute)
      stat_to_min        = to_min(stationary_hour,stationary_minute)
      report_current     = get_current_draw("Report Current",device_name).to_f
      report_time        = get_current_draw("Report Time", device_name).to_f
      idle_current       = get_current_draw("Idle Current",device_name).to_f
      hib_report_current = get_current_draw("Hib. Report Current",device_name).to_f
      hib_report_time    = get_current_draw("Hib. Report Time",device_name).to_f
      hib_idle_current   = get_current_draw("Hib. Idle Current",device_name).to_f
    end

    hibernation_enabled = true if device_name == "AT4000"
    @test = hibernation_on_calculator(tim,report_current,report_time,motion_to_min,idle_current,hib_report_current,hib_report_time,stat_to_min,hib_idle_current)

    render :layout => false
  end


  ##########################################################################
  # B*(I*(K*60/C)+J*(3600-(K*60/C)))+(24-B)*(H*(L*60/D)+G*(3600-(L*60/D))) #
  ##########################################################################
  def hibernation_on_calculator(percent,report_current,report_time,motion_report_rate,idle_current,hib_report_current,hib_report_time,stationary_report_time,hib_idle_current)
    hours_of_motion_per_day(percent)*(report_current*(report_time*60/motion_report_rate)+idle_current*(3600-(report_time*60/motion_report_rate)))+(24-hours_of_motion_per_day(percent))*(hib_report_current*(hib_report_time*60/stationary_report_time)+hib_idle_current*(3600-(hib_report_time*60/stationary_report_time))).to_f
  end

  def hours_of_motion_per_day percent
    percent / 100 * 24
  end

  def get_current_draw (state,device_name)
    DeviceState.find(:first,:conditions => ["state = ? AND device_id = ?",state,Device.find_by_name(device_name)]).current_draw
  end

  def to_min hours,minutes
    (hours.to_i * 60) + minutes.to_i
  end
end
