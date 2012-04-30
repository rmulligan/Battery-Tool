class GuisController < ApplicationController
  def index
    @title = "Battery Life Calculator"
    #######################################################
    # Shortcut for creating a hash with percentages 5-100 #
    #######################################################
    @percentage = {}
    reference = 5
    count = 20
    while count > 0
      count -= 1
      percent = "#{reference}%"
      @percentage[percent] = reference
      reference += 5
    end
    ######################################################
    # Populate hash with device id and name for dropdown #
    ######################################################
    @devices = {}
    BtDevice.all.each do |device|
      @devices[device.name] = device.name
    end
    #######################################################
    # Time intervals for Stationary/Motion Check-In Rates #
    #######################################################
    @hours = { "00" => "00",
               "01" => "01",
               "02" => "02",
               "04" => "04",
               "06" => "06",
               "08" => "08",
               "12" => "12"
    }

    @minutes = { "00" => "00",
                 "01" => "01",
                 "02" => "02",
                 "05" => "05",
                 "10" => "10",
                 "15" => "15",
                 "30" => "30"
    }


    # Time Selector Used With ILC1500 Stationary Check-In Rate
    @hours2 = { "00" => "00",
                "01" => "01",
                "02" => "02",
                "04" => "04",
                "06" => "06",
                "08" => "08",
                "12" => "12"
    }

    @minutes2 = { "05" => "05",
                  "10" => "10",
                  "15" => "15",
                  "30" => "30"
    }

  end

  def tool_index
    @title = "Tools Directory"
  end

end
