# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_inactive_cutomer, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  protected
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    customer_customer_path(resource)
  end

  def reject_inactive_cutomer
    @customer = Customer.find_by(id: params[:customer][:name])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
        redirect_to new_customer_session_path
      end
    end
  end
end
