def sign_up(user)
  visit "/users/sign_up"

  fill_in 'Name', with: user.name
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password

  submit_form
end

def sign_in(user)
  visit "/users/sign_in"

  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password

  submit_form
end

def submit_form
  find('input[name="commit"]').click
end

def id_helper(id)
  "registration_questionaire_#{id}"
end

def submit_registration_form(card_number = '4242424242424242',
                              card_year = '2020',
                              card_code = '123')
    #questionaire
    fill_in id_helper('baby_name'), with: 'baby'
    fill_in id_helper('naps_per_day'), with: 5
    fill_in id_helper('nap_location'), with: 'crib'
    fill_in id_helper('nap_routine'), with: '1 book'
    fill_in id_helper('night_location'), with: 'bed'
    fill_in id_helper('night_routine'), with: '3 books'
    fill_in id_helper('desired_sleep_location'), with: 'crib'
    fill_in id_helper('sleep_obstacle'), with: 'many nightwakings'
    fill_in id_helper('nightwakings'), with: 5
    fill_in id_helper('sleep_goal'), with: 'sleep through night'
    fill_in id_helper('referred_by'), with: 'friend'

    click_button 'Submit'
    #payment
    fill_in 'name', with: 'Test User'
    fill_in 'address_line1', with: '123 street place'
    fill_in 'address_city', with: 'City'
    select('CA', :from => 'address_state')
    fill_in 'address_zip', with: '12345'
    fill_in 'card_number', with: card_number
    select(card_year, :from => 'card_year')
    fill_in 'card_code', with: card_code

    submit_form
end
