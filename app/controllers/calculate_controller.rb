class CalculateController < ApplicationController
  def crunch
    device_name         = params["device"]["name"]
    motion_hour         = params["motion"]["hour"]
    motion_hour         = 0 if motion_hour == "HH"
    motion_minute       = params["motion"]["minute"]
    motion_minute       = 0 if motion_minute == "MM"
    stationary_hour     = params["stationary"]["hour"]
    stationary_hour     = 0 if stationary_hour == "HH"
    stationary_minute   = params["stationary"]["minute"]
    stationary_minute   = 0 if stationary_minute == "MM"
    motion_percent      = params["tim"]["percent"].to_f / 100
    stationary_percent  = 1 - motion_percent
    hibernation_enabled = params["hibernate"].nil? ? false : true

    ##################################
    # These devices do not hibernate #
    ##################################

    if device_name == "PT200" || device_name == "SLM" || device_name == "Mini MT"
      hibernation_enabled = false
    end

    ################
    # ... these do #
    ################
    if device_name == "AT4000"
      hibernation_enabled = true
    end

    ################################################################
    # Time in motion does not matter unless hibernation is enabled #
    ################################################################

    if !hibernation_enabled
      motion_percent     = 1
      stationary_percent = 0
    end


    if device_name == "PT200" || device_name == "SLM" || device_name == "Mini MT"
      report_current     = get_current_draw("Report Current",device_name).to_f rescue 0
      report_time        = get_current_draw("Report Time", device_name).to_f   rescue 0
      idle_current       = get_current_draw("Idle Current",device_name).to_f   rescue 0
      hib_report_current = 0
      hib_report_time    = 1
      hib_idle_current   = 0
      motion_to_sec      = to_min(motion_hour,motion_minute) * 60
      stat_to_sec        = 1
      motion_percent     = 1
      stationary_percent = 0
    elsif device_name == "AT4000"
      motion_to_sec      = 1
      stat_to_sec        = to_min(stationary_hour,stationary_minute) * 60
      hib_report_current = get_current_draw("Hib. Report Current",device_name).to_f rescue 0
      hib_report_time    = get_current_draw("Hib. Report Time",device_name).to_f rescue 0
      hib_idle_current   = get_current_draw("Hib. Idle Current",device_name).to_f rescue 0
      report_current     = 0
      report_time        = 1
      idle_current       = 0
      motion_percent     = 0
      stationary_percent = 1
    else
      motion_to_sec      = to_min(motion_hour,motion_minute) * 60
      stat_to_sec        = to_min(stationary_hour,stationary_minute) * 60
      hib_report_current = get_current_draw("Hib. Report Current",device_name).to_f rescue 0
      hib_report_time    = get_current_draw("Hib. Report Time",device_name).to_f rescue 0
      hib_idle_current   = get_current_draw("Hib. Idle Current",device_name).to_f rescue 0
      report_current     = get_current_draw("Report Current",device_name).to_f rescue 0
      report_time        = get_current_draw("Report Time", device_name).to_f rescue 0
      idle_current       = get_current_draw("Idle Current",device_name).to_f rescue 0
    end


    internal_capacity   = Battery.find_by_name("#{device_name} Internal").capacity.to_f rescue nil
    four_ah_capacity    = Battery.find_by_name("#{device_name} 4Ah").capacity.to_f rescue nil
    ten_ah_capacity     = Battery.find_by_name("#{device_name} 10Ah").capacity.to_f rescue nil
    twenty_ah_capacity  = Battery.find_by_name("#{device_name} 20Ah").capacity.to_f rescue nil

    average_motion_current = average_mot_current(report_current,report_time,motion_to_sec,idle_current)
    average_hibernation_current = average_hib_current(hib_report_current,hib_report_time,stat_to_sec,hib_idle_current)
    average_stationary_current  = average_sta_current(hib_report_current,hib_report_time,stat_to_sec,idle_current)




    ################################
    # SEND CALCULATIONS TO SCREEN  #
    ################################
    if hibernation_enabled
      unless internal_capacity.nil?
        @internal_life = sprintf("%.2f",battery_life_hib(internal_capacity,
                                                         motion_percent,
                                                         average_motion_current,
                                                         stationary_percent,
                                                         average_hibernation_current))
        @min_internal_life = sprintf("%.2f",@internal_life.to_f - (@internal_life.to_f * 0.0125))
        @max_internal_life = sprintf("%.2f",@internal_life.to_f + (@internal_life.to_f * 0.0125))
      else
        @internal_life     = "N/A"
        @min_internal_life = "N/A"
        @max_internal_life = "N/A"
      end
      unless four_ah_capacity.nil?
        @four_ah_life = sprintf("%.2f",battery_life_hib(four_ah_capacity,
                                                        motion_percent,
                                                        average_motion_current,
                                                        stationary_percent,
                                                        average_hibernation_current))
        @min_four_ah_life = sprintf("%.2f",@four_ah_life.to_f - (@four_ah_life.to_f * 0.0125))
        @max_four_ah_life = sprintf("%.2f",@four_ah_life.to_f + (@four_ah_life.to_f * 0.0125))

      else
        @four_ah_life     = "N/A"
        @min_four_ah_life = "N/A"
        @max_four_ah_life = "N/A"
      end
      unless ten_ah_capacity.nil?
        @ten_ah_life = sprintf("%.2f",battery_life_hib(ten_ah_capacity,
                                                       motion_percent,
                                                       average_motion_current,
                                                       stationary_percent,
                                                       average_hibernation_current))
        @min_ten_ah_life = sprintf("%.2f",@ten_ah_life.to_f - (@ten_ah_life.to_f * 0.0125))
        @max_ten_ah_life = sprintf("%.2f",@ten_ah_life.to_f + (@ten_ah_life.to_f * 0.0125))
      else
        @ten_ah_life     = "N/A"
        @min_ten_ah_life = "N/A"
        @max_ten_ah_life = "N/A"
      end
      unless twenty_ah_capacity.nil?
        @twenty_ah_life = sprintf("%.2f",battery_life_hib(twenty_ah_capacity,
                                                          motion_percent,
                                                          average_motion_current,
                                                          stationary_percent,
                                                          average_hibernation_current))
        @min_twenty_ah_life = sprintf("%.2f",@twenty_ah_life.to_f - (@twenty_ah_life.to_f * 0.0125))
        @max_twenty_ah_life = sprintf("%.2f",@twenty_ah_life.to_f + (@twenty_ah_life.to_f * 0.0125))
      else
        @twenty_ah_life     = "N/A"
        @min_twenty_ah_life = "N/A"
        @max_twenty_ah_life = "N/A"
      end
    else
      ########################
      # Hibernation Disabled #
      ########################

      unless internal_capacity.nil?
        @internal_life = sprintf("%.2f",battery_life(internal_capacity,
                                                     motion_percent,
                                                     average_motion_current,
                                                     stationary_percent,
                                                     average_stationary_current))
        @min_internal_life = sprintf("%.2f",@internal_life.to_f - (@internal_life.to_f * 0.0125))
        @max_internal_life = sprintf("%.2f",@internal_life.to_f + (@internal_life.to_f * 0.0125))
      else
        @internal_life     = "N/A"
        @min_internal_life = "N/A"
        @max_internal_life = "N/A"
      end
      unless four_ah_capacity.nil?
        @four_ah_life = sprintf("%.2f",battery_life(four_ah_capacity,
                                                    motion_percent,
                                                    average_motion_current,
                                                    stationary_percent,
                                                    average_stationary_current))
        @min_four_ah_life = sprintf("%.2f",@four_ah_life.to_f - (@four_ah_life.to_f * 0.0125))
        @max_four_ah_life = sprintf("%.2f",@four_ah_life.to_f + (@four_ah_life.to_f * 0.0125))
      else
        @four_ah_life     = "N/A"
        @min_four_ah_life = "N/A"
        @max_four_ah_life = "N/A"
      end
      unless ten_ah_capacity.nil?
        @ten_ah_life = sprintf("%.2f",battery_life(ten_ah_capacity,
                                                   motion_percent,
                                                   average_motion_current,
                                                   stationary_percent,
                                                   average_stationary_current))
        @min_ten_ah_life = sprintf("%.2f",@ten_ah_life.to_f - (@ten_ah_life.to_f * 0.0125))
        @max_ten_ah_life = sprintf("%.2f",@ten_ah_life.to_f + (@ten_ah_life.to_f * 0.0125))
      else
        @ten_ah_life     = "N/A"
        @min_ten_ah_life = "N/A"
        @max_ten_ah_life = "N/A"
      end
      unless twenty_ah_capacity.nil?
        @twenty_ah_life = sprintf("%.2f",battery_life(twenty_ah_capacity,
                                                      motion_percent,
                                                      average_motion_current,
                                                      stationary_percent,
                                                      average_stationary_current))
        @min_twenty_ah_life = sprintf("%.2f",@twenty_ah_life.to_f - (@twenty_ah_life.to_f * 0.0125))
        @max_twenty_ah_life = sprintf("%.2f",@twenty_ah_life.to_f + (@twenty_ah_life.to_f * 0.0125))
      else
        @twenty_ah_life = "N/A"
        @min_twenty_ah_life = "N/A"
        @max_twenty_ah_life = "N/A"
      end
    end
    render :layout      => false
  end

  def battery_life_hib(battery_capacity,
                       percent_in_motion,
                       average_motion_current,
                       percent_stationary,
                       average_hib_current)
    battery_capacity / ((percent_in_motion * average_motion_current) + (percent_stationary * average_hib_current))
  end

  def battery_life(battery_capacity,
                   percent_in_motion,
                   average_motion_current,
                   percent_stationary,
                   average_stationary_current)
    battery_capacity / ((percent_in_motion * average_motion_current) + (percent_stationary * average_stationary_current))
  end

  def average_mot_current(report_current,report_time,motion_to_sec,idle_current)
    ((((report_time * 60) / motion_to_sec * report_current) + (idle_current * (3600 - ((60 * report_time) / motion_to_sec))))) / 3600
  end

  def average_sta_current(report_current,report_time,stat_to_sec,idle_current)
    ((((report_time * 60) / stat_to_sec) * report_current) + (idle_current * (3600 - ((60 * report_time) / stat_to_sec)))) / 3600
  end

  def average_hib_current(hib_report_current,hib_report_time,stat_to_sec,hib_idle_current)
    ((((hib_report_time * 60) / stat_to_sec) * hib_report_current) + (hib_idle_current * (3600 - ((60 * hib_report_time) / stat_to_sec)))) / 3600
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

