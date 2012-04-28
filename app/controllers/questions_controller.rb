class QuestionsController < ApplicationController

  before_filter :user_required
  before_filter :admin_required, :only => [:index, :show, :accept, :reject]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def accept
    @question = Question.find(params[:id])
    if @question && @question.update_attribute(:accepted_at, Time.now)
      @question.update_attribute(:rejected_at, nil)
      redirect_to questions_url, notice: 'Question was successfully accepted.' 
    else
      redirect_to questions_url, notice: 'Question was NOT successfully accepted.' 
    end
  end

  def reject
    @question = Question.find(params[:id])
    if @question && @question.update_attribute(:rejected_at, Time.now)
      @question.update_attribute(:accepted_at, nil)
      redirect_to questions_url, notice: 'Question was successfully rejected.' 
    else
      redirect_to questions_url, notice: 'Question was NOT successfully rejected.' 
    end
  end

  def new
    @question = current_user.questions.build
  end

  def create
    @question = current_user.questions.build(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end
