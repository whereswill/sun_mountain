module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = ENV["COMPANY_NAME"]
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def display_date_time(input_date)
    return input_date.strftime("%b. %e, %Y at %I:%M%p")
  end

  def display_date(input_date)
    return input_date.strftime("%b. %e, %Y")
  end

end
