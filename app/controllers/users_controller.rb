class UsersController < ApplicationController
  def get
    render json: User.all
  end

  def put
  end

  def post
  end

  def delete
  end
end
