# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
      contributions_path
  end

  def guest_sign_in
    user = User.find_or_create_by!(name: 'guest',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user  # ユーザーをログインさせる
    flash[:alert] = 'ゲストユーザーとしてログインしました。'
    redirect_to contributions_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     @user = User.find_by(email: params[:user][:email])
     if @user.is_deleted == true
       redirect_to root_path
     else
      super
     end
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #protected

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    contributions_path
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path
  end
end
