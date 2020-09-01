module ControllerMacros
	def sign_in_user
		before do
			@user = create(:user)
			#установка переменных для запроса что бы вызвать sign_in
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in @user
		end
	end
end