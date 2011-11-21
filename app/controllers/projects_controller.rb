# -*- coding: utf-8 -*-
class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = current_user.projects.page(params[:page])
  end

  def show
    unless @project = current_user.projects.find_by_id(params[:id])
      redirect_to root_path, alert: 'プロジェクトが存在しません'
    end
    @comments = @project.comments.page(params[:page])
    @comment = Comment.new
  end

  def edit
    unless @project = current_user.projects.find_by_id(params[:id])
      redirect_to root_path, alert: 'プロジェクトが存在しません'
    end
  end

  def update
    @project = current_user.projects.find_by_id(params[:id])
    if @project.update_attributes(params[:project])
      @project.users.each do |user|
        OfferMailer.inform_comment(@project,user).deliver unless user.id == current_user.id
      end
      redirect_to @project, notice: 'プロジェクトは正常に更新されました'
    else
      render action: "edit"
    end
  end

  def add_comment
    @project = current_user.projects.find_by_id(params[:id])
    @comment = @project.comments.create(:body => params[:body],:user_id => current_user.id)
    if @comment.save
      @project.users.each do |user|
        OfferMailer.inform_comment(@project,user).deliver unless user.id == current_user.id
      end
      redirect_to project_path(@project), notice: "コメントしました。"
    else
      redirect_to project_path(@project), alert: "コメントに失敗しました。"
    end
  end

  def del_comment
    @comment  = current_user.comments.find_by_id(params[:comment_id])
    if @comment.present?
      @comment.destroy
      redirect_to project_path(params[:id]), notice: "コメントを削除しました。"
    else
      redirect_to project_path(params[:id]), notice: "コメントを削除できませんでした。"
    end
  end
end
