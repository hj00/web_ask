class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @name=params[:name]
    @content=params[:content]
    
    Question.create(
      name: @name,
      content: @content
    )
    
    # if what=="익명"
    #   @name="익명"
    # else
    #   @name
    # end
    
    redirect_to :back
  end
  
  def sign_up
  end
  
  def signup_process
    @email = params[:email]
    @name = params[:name]
    @password = params[:password]
    
    User.create(
      email: @email,
      name: @name,
      password: @password
    )
  end
  
  def login
  end
  
  def login_process
    @email = params[:email]
    @password = params[:password]
    @message = ""
    
    user = User.find_by(email: @email)
    
    if user
      if user.password == @password
        session[:user_email] = user.email
        redirect_to '/'
      else
        @message = "비밀번호 틀렸어."
      end
    else
      @message = "너 가입안했거나, 이메일 틀렸어."
    end
  end
  
  def logout
    session.clear
    redirect_to '/'
  end
end
