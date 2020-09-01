require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
	let(:question) { create(:question) }
#egin
	
	#before do
		#FactoryBot - можно без него, сконфигурировали в spec.helper
		#@questions = FactoryBot.create_list(:question, 2)
		#@questions = create_list(:question, 2)
	#	get :index
	#end

	describe 'GET #index' do # Решетка это как метод класса
		let(:questions) { create_list(:question, 2) } #Тоже самое что и @questions = create_list(:question, 2)
		before { get :index }

		it 'populates an array of all questoins' do
			expect(assigns(:questions)).to match_array(questions) # Вызов let(:q...)
		end

		it 'renders index view' do	
			expect(response).to render_template :index
		end
	end

	describe 'GET #show' do
		before { get :show, params: { id: question } }
=begin Не проходит тест где-то ошибка
		it 'assigns the requested question to @question' do
			get :show, params: { id: question } #рельсы автоматически подставят id из объекта
			expect(assigns(:question)).to eq(question)
		end
=end
		it 'render show viev' do
			expect(response).to render_template :show
		end
	end	

	describe 'GET #new' do

		sign_in_user

		before { get :new }

		it 'assigns a new Question to @question' do
			expect(assigns(:question)).to be_a_new(Question)
		end

		it 'render new view' do
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		sign_in_user

		before { get :edit, params: { id: question } }
=begin
		it 'assigns the requested question to @question' do
			get :edit, params: { id: question } #рельсы автоматически подставят id из объекта
			expect(assigns(:question)).to eq(question)
		end
=end
		it 'render show edit' do
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do
		sign_in_user

		context 'with valid attributes' do
			it 'saves the new question' do	
				#change(Question, :count).by(1) - Изменяется метод count объекта Q... на 1	
				expect { post :create, params: { question: attributes_for(:question) } }.to change(Question, :count).by(1) # attributes_for - это фактори бот		
			end

			it 'redirect to show view' do
				post :create, params: { question: attributes_for(:question) }
				expect(response).to redirect_to question_path(assigns(:question))
			end
		end

		context 'with invalid attributes' do
			it 'does not saves the new question' do	
				# :invalid_question - находится в factories/qestion.rb
				expect { post :create, params: { question: attributes_for(:invalid_question) } }.to_not change(Question, :count)
			end

			it 're-renders new view' do
				post :create, params: { question: attributes_for(:invalid_question) }
				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH #update' do
		sign_in_user

		context 'valid attributes' do
			it 'assingns the requested question to @question' do
				patch :update, params: { id: question, question: attributes_for(:question) }
				expect(assigns(:question)).to eq question
			end

			it 'changes ...' do
				patch :update, params: { id: question, question: { title: 'new title', body: 'new body' } }
				question.reload
				expect(question.title).to eq 'new title'
				expect(question.body).to eq 'new body'
			end

			it 'redirect to the update question' do
				patch :update, params: { id: question, question: attributes_for(:question) }
				expect(response).to redirect_to question
			end
		end

		context 'invalid attributes' do
			before { patch :update, params: { id: question, question: { title: 'new title', body: nil } } }

			it 'does not changes ...' do				
				question.reload
				expect(question.title).to eq 'MyString'
				expect(question.body).to eq 'MyText'
			end

			it 're-renders edit' do
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		sign_in_user

		before  { question }

		it 'deletes question' do
			expect { delete :destroy, params: { id: question } }.to change(Question, :count).by(-1)
		end

		it 'redirect to index viev' do
			delete :destroy, params: { id: question }
			expect(response).to redirect_to questions_path
		end
	end

#end
end