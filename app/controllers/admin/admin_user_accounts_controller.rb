class Admin::AdminUserAccountController < Admin::ApplicationController

  def index
    @accounts = AdminUserAccount.all
  end

  def new
    @account = AdminUserAccount.new create_params
    build_associations @account
  end

  def create
    @account = AdminUserAccount.new create_params

    if @account.save
      redirect_to admin_admin_user_accounts_path, notice: '管理者が作成されました'
    else
      flash.now[:alert] = '管理者の作成に失敗しました'
      render :new
    end
  end

  def edit
    @account = AdminUserAccount.find params[:id]
    build_associations @account
  end

  def update
    @account = AdminUserAccount.find params[:id]

    if @account.update_attributes update_params
      redirect_to edit_admin_admin_user_account_path(@account),
        notice: '管理者が更新されました'
    else
      flash.now[:alert] = '管理者の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    account = AdminUserAccount.find params[:id]
    account.destroy

    redirect_to admin_admin_user_accounts_path,
      notice: '管理者を削除しました'
  end


  private def build_associations(account)
    account.build_admin_user unless account.admin_user.present?

    admin_user = account.admin_user

    admin_user.build_avatar unless admin_user.avatar.present?
  end

  private def create_params
    params
    .require(:admin_user_account)
    .permit(
      :email,
      :password,
      :password_confirmation,
      {
        admin_user_attributes: [
          :name,
          { avatar_attributes: [:asset] }
        ]
      }
    )
  end

  private def update_params
    params
    .require(:admin_user_account)
    .permit(
      :email,
      :password,
      :password_confirmation,
    )
  end

end
