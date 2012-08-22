module ChronoTrigger
  
  class CronEntry
   
    def initialize(options={})
      set_days(options[:days])
      set_hours(options[:hours])
      set_minutes(options[:minutes])
    end

    DAYS_CONVERSION = {
      :sunday     => 0,
      :monday     => 1,
      :tuesday    => 2,
      :wednesday  => 3,
      :thursday   => 4,
      :friday     => 5,
      :saturday   => 6
    }
    
    CALENDAR_DAYS = *(1..31)
    
    def set_hours(*args)
      args.compact!
      args.flatten!
      raise ChronoTrigger::ConfigurationException.new("Hours must be less than 24") if args.any? {|hour| hour >= 24}
      @hours = args
    end
    
    def set_days(*args)
      args.compact!
      args.flatten!
      args.each {|day| raise ChronoTrigger::ConfigurationException.new("Day #{day} setting is invalid") if !DAYS_CONVERSION.keys.include?(day)}
      @days = args.map { |day| DAYS_CONVERSION[day] }
    end

    def set_minutes(*args)
      args.compact!
      args.flatten!
      raise ChronoTrigger::ConfigurationException.new("Minutes must be less than 60") if args.any? {|minute| minute >= 60}      
      @minutes = args
    end
    
    def set_calendar_days(*args)
      args.compact!
      args.flatten!
      args.each {|calendar_day| raise ChronoTrigger::ConfigurationException.new("Calendar Day #{calendar_day} setting is invalid") if !CALENDAR_DAYS.include?(calendar_day)}
      @calendar_days = args
    end 

    def matches?(datetime)
      if @minutes.blank? && !@days.blank?
        raise ChronoTrigger::ConfigurationException.new("Days were specified for a CronEntry with no minutes specified") 
      end
      
      if (@minutes.blank? || @hours.blank?) && !@calendar_days.blank?
        raise ChronoTrigger::ConfigurationException.new("Calendar Days were specified for a CronEntry with no minutes and/or no hours specified")  
      end

      if !@days.blank? && !@calendar_days.blank?
        raise ChronoTrigger::ConfigurationException.new("Calendar Days and Days were specified.  This is unsupported.")    
      end
      
      return false if !@minutes.blank? && !@minutes.include?(datetime.min)
      return false if !@hours.blank? && !@hours.include?(datetime.hour)
      return false if (!@days.blank? && !@days.include?(datetime.wday)) || (!@calendar_days.blank? && !@calendar_days.include?(datetime.day))
      return true
    end

  end
end