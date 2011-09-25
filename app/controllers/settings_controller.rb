# -*- coding: utf-8 -*-
class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to settings_profile_path, :notice =>'プロフィール情報変更が成功しました。'
    else
      render settings_profile_path
    end
  end
end
