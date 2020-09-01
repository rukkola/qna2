require 'rails_helper'

feature 'User sing in', %q{
	In order to be able to ask question
	As an User
	I want to be able to sing in
} do 

	given(:user) { create(:user) } # Использовали FactoryBot

	scenario 'Registered user try to sign in' do
		
		sign_in(user)
		#save_and_open_page #  открывает браузер gem 'launchy'

		expect(page).to have_content 'Signed in successfully'
		expect(current_path).to eq root_path
	end

	scenario 'Non-registered user try to sign in' do
		visit new_user_session_path
		fill_in 'Email', with: 'wrong@test.com'
		fill_in 'password', with: '123456'
		click_on 'Log in'

		expect(page).to have_content 'Invalid Email or password.'
		expect(current_path).to eq new_user_session_path
	end

end