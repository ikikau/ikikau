class Admin::UserAccountsController < Admin::ApplicationController

  def index
    @accounts = UserAccount
      .order(created_at: :desc)
      .page(params[:page])
  end

  def new
    @account = UserAccount.new create_params
  end

  def create
    @account = UserAccount.new permit_params
    @account.confirm!

    if @account.save
      redirect_to edit_admin_user_account_path(@account),
        notice: 'ユーザが作成されました'
    else
      flash.now[:alert] = 'ユーザの作成に失敗しました'
      render :new
    end
  end

  def edit
    @account = UserAccount.find params[:id]
  end

  def update
    @account = UserAccount.find params[:id]

    if @account.update_attributes update_params
      redirect_to edit_admin_user_account_path(@account),
        notice: 'ユーザが更新されました'
    else
      flash.now[:alert] = 'ユーザの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    account = UserAccount.find params[:id]
    account.destroy

    redirect_to admin_user_accounts_path,
      notice: 'ユーザを削除しました'
  end


  private def create_params
    params
    .require(:user_account)
    .permit(
      :email,
      :password,
      :password_confirmation,
      {
        user_attributes: [
          :name,
          :profile,
          :role,
        ]
      }
    )
  end

  private def update_params
    params
    .require(:user_account)
    .permit(
      :email,
      :password,
      :password_confirmation,
    )
  end

end
