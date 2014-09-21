class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User
      .order(created_at: :desc)
      .page(params[:page])
  end

  def new
    @user = User.new permit_params
  end

  def create
    @user = User.new permit_params
    @user.confirm!

    if @user.save
      redirect_to edit_admin_user_path(@user),
        notice: 'ユーザが作成されました'
    else
      flash.now[:alert] = 'ユーザの作成に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes permit_params
      redirect_to edit_admin_user_path(@user),
        notice: 'ユーザが更新されました'
    else
      flash.now[:alert] = 'ユーザの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to admin_users_path,
      notice: 'ユーザを削除しました'
  end


  private def permit_params
    params
    .require(:user)
    .permit(
      :name,
      :profile,
      :role,
    )
  end

end
