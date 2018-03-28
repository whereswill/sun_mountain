# Set custom Date/time formats in this file
# Be sure to restart your server when you modify this file.

# Customize Defaults or assign them to a custom format below
# Date::DATE_FORMATS[:default]="%m/%d/%Y"
# Time::DATE_FORMATS[:default]="%m/%d/%Y %H:%M"

# Date instances
Date::DATE_FORMATS[:new_default] = "%m-%d-%Y"       # date.to_s(:new_default)   ---->  12-24-2009
Date::DATE_FORMATS[:common] = "%m/%d/%Y"            # date.to_s(:common)        ---->  12/24/2009

# DateTime instance
Time::DATE_FORMATS[:datetime] = "%H:%M %d-%b-%Y"    # datetime.to_s(:datetime)  ---->  15:30 24-Dec-2009
Time::DATE_FORMATS[:date] = "%d-%b-%Y"              # datetime.to_s(:date)      ---->  24-Dec-2009
Time::DATE_FORMATS[:nice_date] = "%b %d, %Y"        # datetime.to_s(:date)      ---->  Dec 24, 2009
Time::DATE_FORMATS[:nice_datetime] = "%b %d, %Y at %l:%M %p"
                                                    # datetime.to_s(:nice_datetime)---->  Dec 24, 2009 at 4:35 PM
Time::DATE_FORMATS[:time] = "%H:%M"                 # datetime.to_s(:time)      ---->  15:30
Time::DATE_FORMATS[:nice_time] = "%l:%M %p"         # datetime.to_s(:nice_time) ---->  4:35 PM
Time::DATE_FORMATS[:google] = "%Y-%m-%d %H:%M:%S"   # datetime.to_s(:google)    ---->  2009-12-24 15:30:27


# Assign default to a defined custom format from above
# Date::DATE_FORMATS[:default] = Date::DATE_FORMATS[:common]
# Time::DATE_FORMATS[:default] = Time::DATE_FORMATS[:nice_time]
