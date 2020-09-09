require_relative 'acceptance_helper'

feature 'User answer', %q{
  I want to be able to create answers
} do 

  given(:user) { create(:user) }
  given(:question) { create(:question) }
#=begin	
  scenario 'Autenticated user create', js: true do
    sign_in(user)
    visit question_path(question)

    fill_in 'Your answer', with: 'My answer'
    click_on 'Create'

    expect(current_path).to eq question_path(question)
    within '.answers' do
    	expect(page).to have_content 'My answer'
    end
  end
#=end	

  scenario 'User try create invalidate', js: true do
  	sign_in user
  	visit question_path(question)

  	click_on 'Create'
  	expect(page).to have_content "Body can't be blank"
  end
end