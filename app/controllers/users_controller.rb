class UsersController < ApplicationController
  include Swagger::Blocks

  ########## START OF SWAGGER DOCUMENTATION ##########
  swagger_path '/me' do
    operation :get do
      key :summary, "Get current user"
      key :description, "Get details for current user. Must be authorized"
      key :operationId, getUser
      key :tags, ['Users']

      response 200 do
        key :description, "User retrieved."
        schema do
          key :"$ref", :User
        end
      end
    end
  end

  swagger_path '/signup' do
    operation :post do
      key :summary, "Create new user"
      key :description, "Register new user given parameters"
      key :operationId, signup
      key :tags, ['Users']

      parameter do
        key :name, :body
        key :in, :body
        key :required, true
        key :description, "Username of new user"
        schema do
          key :"$ref", :SignupParam
        end
      end

      
    end
  end

  swagger_schema :User do
  end

  swagger_schema :SignupParam do
  end
  
  ########## END OF SWAGGER DOCUMENTATION ##########


  before_action :authenticate_user, except: [:create]

  # GET /me
  def index
    render json: current_user, status: 200
  end
  
  # POST /signup
  def create
    @user = User.new(user_create_params)
    
    if @user.save
      render json: @user, status: 201 
    else
      render :json => { :errors => @user.errors.full_messages }, :status => 422
    end
  end

  private
  
  def user_create_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
