#  Area
#-----------------------------------------------
puts '==> Creating areas...'

ActiveRecord::Base.transaction do
  areas = [
    '23区東エリア',
    '23区西エリア',
    '多摩エリア',
    'その他',
  ]

  $areas = []

  areas.each do |area|
    area = Area.new name: area

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

  (1..5).each do |i|
    tag = Tag.new name: 'タグ %d' % i

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
  $the_admin_user_account = AdminUserAccount.new(
    email:    'admin@ikikau.jp',
    password: 'password',
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

  (1..15).each do |i|
    user_account = UserAccount.new(
      email:    'user+%d@example.com' % i,
      password: 'password',
    )

    user = user_account.build_user(
      name:    Gimei.new.kanji,
      profile: '私はやってません。',
    )

    case i
    when 1..5
      user.role = :general
    when 6..10
      user.role = :creator
    when 11..15
      user.role = :organizer
    end

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

  (1..20).each do |i|
    event = Event.new(
      area:          $the_area,
      title:         'イベント %d' % i,
      content:       '説明' * 20,
      status:        :public,
      location_name: '代々木公園',
      prefecture:    13,
      postal_code:   '1510052',
      address:       '渋谷区代々木神園町2−1',
    )

    event.event_creators.build user: $the_user_account.user
    event.event_organizers.build user: $the_user_account.user

    event.event_dates.build(
      start_at: Time.now,
      end_at: Time.now + 10.months,
    )

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
  (1..5).each do |i|
    information = Information.new(
      title:   'お知らせ %d' % i,
      status:  :public,
      content: '内容' * 20,
    )

    information.save!
    print '#'
  end

  puts
end


#  Feature
#-----------------------------------------------
puts '==> Creating features...'

ActiveRecord::Base.transaction do
  (1..5).each do |i|
    feature = Feature.new(
      title:   '特集 %d' % i,
      status:  :public,
      content: '内容' * 20,
    )

    feature.save!
    print '#'
  end

  puts
end
