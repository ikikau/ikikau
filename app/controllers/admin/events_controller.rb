class Admin::EventsController < Admin::ApplicationController

  def index
    @events = Event
      .order(created_at: :desc)
      .page(params[:page])
  end

  def new
    @event = Event.new params[:event]
    build_associations @event
  end

  def create
    @event = Event.new params[:event]
    build_associations @event

    if @event.save
      redirect_to edit_admin_event_path(@event),
        notice: 'イベントが作成されました'
    else
      flash.now[:alert] = 'イベントの作成に失敗しました'
      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
    build_associations @event
  end

  def update
    @event = Event.find params[:id]
    build_associations @event

    if @event.update_attributes params[:event]
      redirect_to edit_admin_event_path(@event),
        notice: 'イベントが更新されました'
    else
      flash.now[:alert] = 'イベントの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    event = Event.find params[:id]
    event.destroy

    redirect_to admin_events_path,
      notice: 'イベントを削除しました'
  end


  private def build_associations(event, num_dates = 1)
    event.build_thumbnail unless event.thumbnail.present?
    num = [0, num_dates - event.event_dates.length].max
    num.times { event.event_dates.build }
  end

  private def permit_params
    params
    .require(:event)
    .permit(
      :area_id,
      :title,
      :content,
      :status,
      :location_name,
      :prefecture,
      :postal_code,
      :address,
      {
        event_dates: [
          :id,
          :start_at,
          :end_at,
          :_destroy,
        ],
        event_organizers: [
          :id,
          :user_id,
          :_destroy,
        ],
      }
    )
  end

end

