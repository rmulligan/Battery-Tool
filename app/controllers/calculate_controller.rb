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
    stationary2_hour    = params["stationary2"]["hour"]
    stationary2_hour    = 0 if stationary2_hour == "HH"
    stationary2_minute  = params["stationary2"]["minute"]
    stationary2_minute  = 0 if stationary2_minute == "MM"
    stationary3_hour    = params["stationary3"]["hour"]
    stationary3_hour    = 0 if stationary3_hour == "HH"
    stationary3_minute  = params["stationary3"]["minute"]
    stationary3_minute  = 0 if stationary3_minute == "MM"
    motion_percent      = params["tim"]["percent"].to_f / 100
    stationary_percent  = 1 - motion_percent
    hibernation_enabled = params["hibernate"].nil? ? false : true

    ##################################
    # These devices do not hibernate #
    ##################################

    if device_name == "PT200" || device_name == "SLM(2)"
      hibernation_enabled = false
    end

    #######################
    # ... these always do #
    #######################
    if device_name == "AT4000"
      hibernation_enabled = true
    end

    #######################
    # Device Conditionals #
    #######################

    if device_name == "PT200"
      report_current     = get_current_draw("Report Current",device_name).to_f rescue 0
      report_time        = get_current_draw("Report Time", device_name).to_f   rescue 0
      idle_current       = get_current_draw("Idle Current",device_name).to_f   rescue 0
      hib_report_current = 0
      hib_report_time    = 1
      hib_idle_current   = 0
      motion_to_sec      = to_sec(motion_hour,motion_minute)
      stat_to_sec        = 1
      motion_percent     = 1
      stationary_percent = 0
    elsif device_name == "AT4000"
      motion_to_sec      = 1
      stat_to_sec        = to_sec(stationary_hour,stationary_minute)
      hib_report_current = get_current_draw("Hib. Report Current",device_name).to_f rescue 0
      hib_report_time    = get_current_draw("Hib. Report Time",device_name).to_f rescue 0
      hib_idle_current   = get_current_draw("Hib. Idle Current",device_name).to_f rescue 0
      report_current     = 0
      report_time        = 1
      idle_current       = 0
      motion_percent     = 0
      stationary_percent = 1
    elsif device_name == "F2i(Pill Bottle Cell)" || device_name == "F2" || device_name == "F3"
      #########################################
      # Minimum 2 minute Stationary check-in  #
      #########################################
      motion_to_sec      = to_sec(motion_hour,motion_minute)
      stat_to_sec        = to_sec(stationary3_hour,stationary3_minute)
      hib_report_current = get_current_draw("Hib. Report Current",device_name).to_f rescue 0
      hib_report_time    = get_current_draw("Hib. Report Time",device_name).to_f rescue 0
      hib_idle_current   = get_current_draw("Hib. Idle Current",device_name).to_f rescue 0
      report_current     = get_current_draw("Report Current",device_name).to_f rescue 0
      report_time        = get_current_draw("Report Time",device_name).to_f rescue 0
      idle_current       = get_current_draw("Idle Current",device_name).to_f rescue 0
    elsif device_name == "ILC1500"
      ###################################################################
      # Because ILC1500 has limitations on the check-in rates available #
      ###################################################################
      motion_to_sec      = to_sec(motion_hour,motion_minute)
      stat_to_sec        = to_sec(stationary2_hour,stationary2_minute)
      hib_report_current = get_current_draw("Hib. Report Current",device_name).to_f rescue 0
      hib_report_time    = get_current_draw("Hib. Report Time",device_name).to_f rescue 0
      hib_idle_current   = get_current_draw("Hib. Idle Current",device_name).to_f rescue 0
      report_current     = get_current_draw("Report Current",device_name).to_f rescue 0
      report_time        = get_current_draw("Report Time", device_name).to_f rescue 0
      idle_current       = get_current_draw("Idle Current",device_name).to_f rescue 0

      ###########################################################################################
      # Replace Hibernation Figures with Normal ones if motion check-in is less than 5 minutes #
      ###########################################################################################
      if motion_to_sec.to_i > to_sec(0,5).to_i
        report_time    = hib_report_time
        report_current = hib_report_current
        idle_current   = hib_idle_current
      end
    else
      motion_to_sec      = to_sec(motion_hour,motion_minute)
      stat_to_sec        = to_sec(stationary_hour,stationary_minute)
      hib_report_current = get_current_draw("Hib. Report Current",device_name).to_f rescue 0
      hib_report_time    = get_current_draw("Hib. Report Time",device_name).to_f rescue 0
      hib_idle_current   = get_current_draw("Hib. Idle Current",device_name).to_f rescue 0
      report_current     = get_current_draw("Report Current",device_name).to_f rescue 0
      report_time        = get_current_draw("Report Time", device_name).to_f rescue 0
      idle_current       = get_current_draw("Idle Current",device_name).to_f rescue 0
    end


    internal_capacity   = BtBattery.find_by_name("#{device_name} Internal").capacity.to_f rescue nil
    four_ah_capacity    = BtBattery.find_by_name("#{device_name} 4Ah").capacity.to_f rescue nil
    ten_ah_capacity     = BtBattery.find_by_name("#{device_name} 10Ah").capacity.to_f rescue nil
    twenty_ah_capacity  = BtBattery.find_by_name("#{device_name} 20Ah").capacity.to_f rescue nil

    average_motion_current      = average_mot_current(report_current,report_time,motion_to_sec,idle_current)
    average_stationary_current  = average_sta_current(report_current,report_time,stat_to_sec,idle_current)
    average_hibernation_current = average_hib_current(hib_report_current,hib_report_time,stat_to_sec,hib_idle_current)
    # Use the hibernation idle current for the average hibernation idle current for Mini MT(new)
    average_hibernation_current = hib_idle_current if device_name == "Mini MT(new)"
    # Use Hi Rate Report  Current for average_motion_current on F Series if motion check in is less than 1 minute
    if (device_name == "F2i(Pill Bottle Cell)" || device_name == "F2" || device_name == "F3") && motion_to_sec.to_i == to_sec(0,1).to_i
      average_motion_current      = get_current_draw("Hi Rate Report Current",device_name).to_f rescue 0
    end
    ###################################################################
    # Set the variable average current depending on hibernation state #
    ###################################################################
    hibernation_enabled ? average_var_current = average_hibernation_current : average_var_current = average_stationary_current

    # Calculate Total Average current using the output from above
    total_average_current = total_avg_current(motion_percent,average_var_current,average_motion_current)
    total_average_current = ((motion_percent.to_f * average_motion_current) + (stationary_percent.to_f * average_hibernation_current)) if device_name == "Mini MT(new)"


    ################################
    # SEND CALCULATIONS TO SCREEN  #
    ################################

    # INTERNAL BATTERY
      unless internal_capacity.nil?
        @internal_life = sprintf("%.2f",hrs_of_use(internal_capacity,total_average_current))
        @min_internal_life = sprintf("%.2f",@internal_life.to_f - (@internal_life.to_f * 0.125))
        @max_internal_life = sprintf("%.2f",@internal_life.to_f + (@internal_life.to_f * 0.125))
      else
        @internal_life     = "N/A"
        @min_internal_life = "N/A"
        @max_internal_life = "N/A"
      end

    # FOUR AMP HOUR BATTERY
      unless four_ah_capacity.nil?
        @four_ah_life =  sprintf("%.2f",hrs_of_use(four_ah_capacity,total_average_current))
        @min_four_ah_life = sprintf("%.2f",@four_ah_life.to_f - (@four_ah_life.to_f * 0.125))
        @max_four_ah_life = sprintf("%.2f",@four_ah_life.to_f + (@four_ah_life.to_f * 0.125))
      else
        @four_ah_life     = "N/A"
        @min_four_ah_life = "N/A"
        @max_four_ah_life = "N/A"
      end

    # TEN AMP HOUR BATTERY
      unless ten_ah_capacity.nil?
        @ten_ah_life = sprintf("%.2f",hrs_of_use(ten_ah_capacity,total_average_current))
        @min_ten_ah_life = sprintf("%.2f",@ten_ah_life.to_f - (@ten_ah_life.to_f * 0.125))
        @max_ten_ah_life = sprintf("%.2f",@ten_ah_life.to_f + (@ten_ah_life.to_f * 0.125))
      else
        @ten_ah_life     = "N/A"
        @min_ten_ah_life = "N/A"
        @max_ten_ah_life = "N/A"
      end

    # TWENTY AMP HOUR BATTERY
      unless twenty_ah_capacity.nil?
        @twenty_ah_life = sprintf("%.2f",hrs_of_use(twenty_ah_capacity,total_average_current))
        @min_twenty_ah_life = sprintf("%.2f",@twenty_ah_life.to_f - (@twenty_ah_life.to_f * 0.125))
        @max_twenty_ah_life = sprintf("%.2f",@twenty_ah_life.to_f + (@twenty_ah_life.to_f * 0.125))
      else
        @twenty_ah_life     = "N/A"
        @min_twenty_ah_life = "N/A"
        @max_twenty_ah_life = "N/A"
      end

    render :layout      => false
  end

  def hrs_of_use(capacity,total_average_current)
    capacity.to_f / total_average_current.to_f
  end

  def average_mot_current(report_current,report_time,motion_to_sec,idle_current)
    ((((3600 * report_time.to_f) / motion_to_sec) / 3600) * report_current) + (((3600 - ((3600 * report_time.to_f) / motion_to_sec)) / 3600) * idle_current)
  end

  def average_sta_current(report_current,report_time,stat_to_sec,idle_current)
    ((((3600 * report_time.to_f) / stat_to_sec) / 3600) * report_current) + (((3600 - ((3600 * report_time.to_f) / stat_to_sec)) / 3600) * idle_current)
  end

  def average_hib_current(hib_report_current,hib_report_time,stat_to_sec,hib_idle_current)
    ((((3600 * hib_report_time.to_f) / stat_to_sec) / 3600) * hib_report_current) + (((3600 - ((3600 * hib_report_time.to_f) / stat_to_sec)) / 3600) * hib_idle_current)
  end

  def total_avg_current(motion_percent,average_var_current,average_motion_current)
    ((1 - motion_percent.to_f) * (average_var_current.to_f)) + (motion_percent.to_f * average_motion_current.to_f)
  end

  def hours_of_motion_per_day percent
    percent / 100 * 24
  end

  def get_current_draw (state,device_name)
    BtDeviceState.find(:first,:conditions => ["state = ? AND device_id = ?",state,BtDevice.find_by_name(device_name)]).current_draw
  end

  def to_sec hours,minutes
    ((hours.to_i * 60) + minutes.to_i) * 60
  end
end
