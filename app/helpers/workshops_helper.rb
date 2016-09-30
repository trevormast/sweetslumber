module WorkshopsHelper
  def spots_left(workshop)
    workshop.limit - workshop.users.count
  end

  def date_format(datetime)
    datetime.strftime("%b %d, %Y")
  end

  def time_format(date_time)
    date_time.strftime("%l:%m %p")
  end

  def user_responses(user, workshop)
    Registration.find_by(user_id: user, workshop_id: workshop.id).questionaire
  end

  def baby_age(user, workshop)
    distance_of_time_in_words(workshop.time, user_responses(user, workshop).baby_dob)
  end
end
