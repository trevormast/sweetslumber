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

  def user_responses(user, workshop)
    Registration.find_by(user_id: user, workshop_id: workshop.id).questionaire
  end

  def baby_age(user, workshop)
    distance_of_time_in_words(workshop.time, user_responses(user, workshop).baby_dob, accumulate_on: :months, only: :months)
  end

  def price_in_dollars(price_in_cents)
    number_to_currency(price_in_cents / 100)
  end
end
