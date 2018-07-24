require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'First User',
      last_name: 'last name',
      email: 'first@user.com',
      password: '123456'
    )
  end

  scenario "User to login via correct password" do
    visit '/login'
    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'
    
      click_button 'Submit'
    end
    sleep(3)
    save_screenshot
  end
end
