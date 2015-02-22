include Ikikau::FactoryGirlHelper


#  Area
#-----------------------------------------------
puts '==> Creating areas...'

ActiveRecord::Base.transaction do
  areas = %w[
    23区東エリア
    23区西エリア
    多摩エリア
    その他
  ]

  $areas = []

  areas.each do |area|
    area = fg_build.area name: area

    area.save!
    $areas << area
    print '#'
  end

  $the_area = $areas.first

  puts
end


#  Tag
#-----------------------------------------------
puts '==> Creating tags...'

ActiveRecord::Base.transaction do
  $tags = []

  5.times do
    tag = fg_build.tag

    tag.save!
    $tags << tag
    print '#'
  end

  puts
end


#  Admin
#-----------------------------------------------
puts '==> Creating an admin user...'

ActiveRecord::Base.transaction do
  $the_admin_user_account = fg_build.admin_user_account(
    email: 'admin@ikikau.com'
  )

  $the_admin_user = $the_admin_user_account.build_admin_user(
    name: '岩永勇輝'
  )

  $the_admin_user_account.save!

  puts '#'
end


#  User
#-----------------------------------------------
puts '==> Creating users...'

ActiveRecord::Base.transaction do
  $user_accounts = []

  15.times do |i|
    user_account = fg_build.user_account

    user = user_account.build_user fg_attrs.user(
      role: %w[participant organizer][2 * (i / 15.0)]
    )

    user_account.save!
    $user_accounts << user_account
    print '#'
  end

  $the_user_account = $user_accounts.first

  puts
end


#  Event
#-----------------------------------------------
puts '==> Creating events...'

ActiveRecord::Base.transaction do
  $events = []

  20.times do
    event = fg_build.event area: $the_area

    event.event_organizers.build fg_attrs.event_organizer(organizer_id: $the_user_account.user.id)
    event.event_schedules.build fg_attrs.event_schedule

    event.save!
    $events << event
    print '#'
  end

  puts
end


#  Information
#-----------------------------------------------
puts '==> Creating infomation...'

ActiveRecord::Base.transaction do
  5.times do
    information = fg_build.information

    information.save!
    print '#'
  end

  puts
end


#  Feature
#-----------------------------------------------
puts '==> Creating features...'

ActiveRecord::Base.transaction do
  5.times do
    feature = fg_build.feature

    feature.save!
    print '#'
  end

  puts
end
