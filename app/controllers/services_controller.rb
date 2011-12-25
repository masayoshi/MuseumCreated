# -*- coding: utf-8 -*-
class ServicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  
  def index
    # get all authentication services assigned to the current user
    @services = current_user.services.all
  end

  def create
    # get the full hash from omniauth
    omniauth = request.env['omniauth.auth']
    authentication = Service.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication.present?
      flash[:notice] = "ログインが完了しました"
      sign_in_and_redirect(:user,authentication.user)
    elsif omniauth.present?
      if user_signed_in?
        current_user.connect_service(omniauth)
        if current_user.save
          redirect_to services_url, notice: "認証が成功しました"
        else
          redirect_to root_path, alert: "エラーが発生しました"
        end
      elsif (omniauth['provider'] == "facebook")
        if existinguser = User.find_by_email(omniauth['info']['email'])
          existinguser.connect_service(omniauth)
          if existinguser.save
            flash[:notice] = "ログインが完了しました"
            sign_in_and_redirect(:user,existinguser)
          else
            redirect_to root_path, alert: "エラーが発生しました"
          end
        else
          session[:omniauth] = omniauth
          redirect_to new_user_registration_url
        end
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    else
      redirect_to root_path, alert: "エラーが発生しました"
    end
  end
  
  def destroy
    # remove an authentication service linked to the current user
    @service = current_user.services.find_by_id(params[:id])

    if @service.present?
      @service.destroy      
      redirect_to services_path, notice: 'サービスが切断されました'
    else
      redirect_to services_path, alert: 'サービスが見つかりませんでした'
    end
  end
end
