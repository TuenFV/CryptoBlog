namespace :vesting do
  desc "remind user a day before vesting date of a project"
  task reminder: :environment do
    Vesting.find_each do |vesting|
      if vesting.date.tomorrow?
        pool = vesting.pool
        user = pool.user

        UserMailer.with(user: user, pool: pool, vesting: vesting).remind_vesting_date.deliver
      end
    end
  end

  desc "remind user on vesting day"
  task reminder_today: :environment do
    Vesting.find_each do |vesting|
      if vesting.date.today?
        pool = vesting.pool
        user = pool.user

        UserMailer.with(user: user, pool: pool, vesting: vesting).remind_vesting_date_today.deliver
      end
    end
  end
end
