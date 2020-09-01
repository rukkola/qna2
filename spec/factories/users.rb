FactoryBot.define do
  
  sequence :email do |n| #уникальная последовательность
  	"user#{n}@test.com"
  end

  factory :user do
    email			#вызываем метод  sequence :email 
    password { '123456' }
    password_confirmation { '123456' }
  end
end
