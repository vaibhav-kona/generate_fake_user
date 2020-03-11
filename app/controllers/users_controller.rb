class UsersController < ApplicationController
  def get
    render json: User.all
  end

  def put
    user = User.find_by_id(update_params[:user_id])

    if user
      user.update({name: update_params[:name]})
      render json: {message: "User updated successfully"}
    else
      render json: {message: "User not found"}, status: 422
    end
  end

  def post      
    user = User.new({name: post_params[:name]})
    if user.save
      render json: {user: user, message: "User created successfully"}
    else
      render json: {message: "Some error occured", errors: user.errors}, status: 422
    end
  end

  def delete
    user = User.find_by_id(delete_params[:user_id])
    
    if user
      user.delete
      render json: {message: "User deleted successfully"}
    else
      render json: {message: "User not found"}, status: 400
    end
  end

  private

  def delete_params
    params.permit(:user_id)
  end

  def update_params
    params.permit(:name, :user_id)
  end

  def post_params
    params.permit(:name)
  end

end
