module MailerHelper
  def sleep_guide_link(registration)
    baby_date_of_birth = registration.questionaire.baby_dob
    workshop_date = registration.workshop.time

    age_by_workshop_date = (workshop_date - baby_date_of_birth) / 2592000

    return sleep_guide_base_url + age_range(age_by_workshop_date) + sleep_guide_suffix
  end

  def sleep_guide_base_url
    return 'https://www.preciouslittlesleep.com/'
  end

  def sleep_guide_suffix
    return '-baby-sleep-survival-guide/'
  end

  def age_range(age)
    if age.between?(0, 3)
      return 'newborn'
    elsif age.between?(4, 6)
      return '3-6-month'
    elsif age.between?(7, 9)
      return '6-9-month'
    elsif age.between?(10, 12)
      return '9-12-month'
    else
      return '9-12-month'
    end
  end
end