class QuestionsController < ApplicationController

	 before_action :load_question, only: [:show, :edit, :update, :destroy]
	 before_action :authenticate_user!, except: [ :index, :show ]

	 def index
 		 @questions = Question.all
 	 end

	 def show
 		 @answer = @question.answers.build
		 @answer.attachments.build
 	 end

	 def new
 		 @question = Question.new
		 @question.attachments.build # создаем новый объект в массиве Attachment
 	 end

	 def edit
 	 end

	 def create
 		#@question = Question.create(question_params)
 		 @question = Question.new(question_params)
 		 if @question.save
 			 flash[:notice] = 'Your question successfully created.'
 			redirect_to @question
 		 else
 			 render :new
 		 end
 	 end

	 def update
 		 if @question.update(question_params)
  			 redirect_to @question
  		else
  			 render :edit
  		end
	 end

	 def destroy
 		 @question.destroy
 		redirect_to questions_path
 	 end

	private

	 def load_question
 		 @question = Question.find(params[:id]) 
	 end

	 def question_params
 		 params.require(:question).permit(:title, :body, attachments_attributes: [:file]) # attachments_attributes: [:file]) - заголовок для файла
 	 end
end
