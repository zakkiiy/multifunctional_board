class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    p params
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path, notice: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました', status: :see_other
  end
end