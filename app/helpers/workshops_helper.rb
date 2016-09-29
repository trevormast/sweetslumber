module WorkshopsHelper
  def spots_left(workshop)
    workshop.limit - workshop.users.count
  end

  def date_format(datetime)
    datetime.strftime("%b %d, %Y")
  end

  def time_format(date_time)
    date_time.strftime("%l:%M %p")
  end
end
