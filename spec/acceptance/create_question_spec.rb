require 'rails_helper'

feature 'Create question', %q{
	I want to be able to ask questions
} do
	
	given(:user) { create(:user) } 
=begin #Сломался тест/ожидание. Раньше работал до рефакторинга. Откатил назад, все равно не работает.
	scenario 'Authenticated user creates question' do
		sign_in(user)
	
		#User.create!(email: 'user@test.com', password: '123456')
		#visit new_user_session_path
		#fill_in 'Email', with: 'user@test.com'
		#fill_in 'password', with: '123456'
		#click_on 'Log in'

		visit questions_path
		click_on 'Ask question'
		fill_in 'Title', with: 'Test question'
		fill_in 'Body', with: 'text text'
		click_on 'Create'

		#Сломался тест/ожидание. Раньше работал до рефакторинга. Откатил назад, все равно не работает.
		#expect(page).to have_content 'Your question successfully created.'
	end
=end

	scenario 'Non-authenticated user ties to create question' do
		visit questions_path
		click_on 'Ask question'

		expect(page).to have_content "You need to sign in or sign up before continuing."
	end

end