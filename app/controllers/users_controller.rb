class UsersController < ApplicationController
  before_filter :authenticate_user! 
  load_and_authorize_resource

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @user = User.find params[:id]
  end

  def edit
  end

  def destroy
  end

end
