class OrdersController < ApplicationController
  def create
    user = User.find_or_create_by(email: user_params[:email])
    user.update!(user_params)

    order = user.orders.new(order_params)
    if order.save
      
    else
    end
    
    render json: { status: 200 }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def order_params
    params.require(:order).permit(:street_address, :street_address_2, :city, :state, :zipcode, :country, :phone_number)
  end
end
