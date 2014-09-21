class Admin::AdminUserAccountController < Admin::ApplicationController

  def index
    @admin = AdminUser.all
  end

  def new
    @admin = AdminUser.new permit_params
    build_associations @admin
  end

  def create
    @admin = AdminUser.new permit_params

    if @admin.save
      redirect_to admin_admin_users_path, notice: '管理者が作成されました'
    else
      flash.now[:alert] = '管理者の作成に失敗しました'
      render :new
    end
  end

  def edit
    @admin = AdminUser.find params[:id]
    build_associations @admin
  end

  def update
    @admin = AdminUser.find params[:id]

    if @admin.update_attributes permit_params
      redirect_to edit_admin_admin_user_path(@admin),
        notice: '管理者が更新されました'
    else
      flash.now[:alert] = '管理者の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    admin = AdminUser.find params[:id]
    admin.destroy

    redirect_to admin_admin_users_path,
      notice: '管理者を削除しました'
  end


  private def build_associations(admin_user)
    admin_user.build_avatar unless admin_user.avatar.present?
  end

  private def permit_params
    params
    .require(:admin_user)
    .permit(
      :name,
      {
        avatar_attributes: [
          :id,
          :asset,
          :_destroy,
        ]
      }
    )
  end

end
