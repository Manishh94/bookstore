module ApplicationHelper
  def formatted_duration(total_minute)
    hours = total_minute / 60
    minutes = (total_minute) % 60
    "#{ hours }h #{ minutes }min"
  end
end
