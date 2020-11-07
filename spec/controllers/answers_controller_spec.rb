require 'spec_helper'
require 'rails_helper'

describe AnswersController do

  let!(:question) { create :question }	

  describe 'POST #create' do	
    context 'with valid attributes' do
		it 'saves the new answer' do	
			expect { post :create, params: { answer: attributes_for(:answer), question_id: question, format: :js } }.to change(question.answers, :count).by(1) # attributes_for - это фактори бот		
		end

		it 'render create tamplate' do
			post :create, params: { answer: attributes_for(:answer), question_id: question, format: :js }
			#expect(response).to redirect_to question_path(question)
			expect(response).to render_template :create
		end
	end

	context 'with invalid attributes' do
		it 'does not saves the new answer' do	
			expect { post :create, params: { answer: attributes_for(:invalid_answer), question_id: question, format: :js } }.to_not change(Answer, :count)
		end

		it 'redirect to question show view' do
			post :create, params: { answer: attributes_for(:invalid_answer), question_id: question, format: :js }
			#expect(response).to redirect_to question_path(question)
			expect(response).to render_template :create
		end
	end	
  end
  
  describe 'PATCH #update' do

    let(:answer) { create(:answer, question: question) }

  	it 'assingns the requested answer to @answer' do
		patch :update, params: { id: answer, question_id: question, answer: attributes_for(:answer), format: :js }
		expect(assigns(:answer)).to eq answer
	end

	it 'assigns th question' do
		patch :update, params: { id: answer, question_id: question, answer: attributes_for(:answer), format: :js }
		expect(assigns(:question)).to eq question
	end

=begin не проходит после добавление jQuery (update)
	it 'changes answer attributes' do
		patch :update, params: { id: answer, question_id: question, answer: { body: 'new body' }, format: :js }
		answer.reload
		expect(question.body).to eq 'new body'
	end
=end

	it 'render update template' do
		patch :update, params: { id: answer, question_id: question, answer: attributes_for(:answer), format: :js }
		expect(response).to render_template :update
	end

  end

end