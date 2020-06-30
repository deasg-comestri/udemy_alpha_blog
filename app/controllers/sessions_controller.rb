class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    byebug
  end

  def destroy
  end

end
