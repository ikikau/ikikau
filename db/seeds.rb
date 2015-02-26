include Ikikau::FactoryGirlHelper

ActiveRecord::Base.after_save { print '#' }

def section(name)
  puts '==> Creating %s...' % name

  ActiveRecord::Base.transaction do
    yield
    puts
  end
end


#  Area
#-----------------------------------------------
section 'areas' do
  $areas = []

  [
    '23区東エリア',
    '23区西エリア',
    '多摩エリア',
    'その他',
  ].each do |area|
    area = fg_build.area name: area

    area.save!
    $areas << area
  end

  $the_area = $areas.first
end


#  Tag
#-----------------------------------------------
section 'tags' do
  $tags = []

  5.times do
    tag = fg_build.tag

    tag.save!
    $tags << tag
  end
end


#  Admin
#-----------------------------------------------
section 'an admin user' do
  $the_admin_user_account = fg_build.admin_user_account(
    email: 'admin@ikikau.com'
  )

  $the_admin_user = $the_admin_user_account.build_admin_user(
    name: '岩永勇輝'
  )

  $the_admin_user_account.save!
end


#  User
#-----------------------------------------------
section 'users' do
  $user_accounts = []

  15.times do |i|
    user_account = fg_build.user_account

    user = user_account.build_user fg_attrs.user(
      role: %w[participant organizer][2 * (i / 15.0)]
    )

    user_account.save!
    $user_accounts << user_account
  end

  $the_user_account = $user_accounts.first
end


#  Event
#-----------------------------------------------
section 'events' do
  $events = []

  20.times do
    event = fg_build.event area: $the_area

    event.event_organizers.build fg_attrs.event_organizer(organizer_id: $the_user_account.user.id)
    event.event_schedules.build fg_attrs.event_schedule

    event.save!
    $events << event
  end
end


#  Information
#-----------------------------------------------
section 'infomation' do
  5.times do
    information = fg_build.information

    information.save!
  end
end


#  Feature
#-----------------------------------------------
section 'features' do
  5.times do
    feature = fg_build.feature

    feature.save!
  end
end
