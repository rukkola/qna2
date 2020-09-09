require 'spec_helper'
require 'rails_helper'

describe AnswersController do
  describe 'POST #create' do
  	let(:question) { create :question }

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
end