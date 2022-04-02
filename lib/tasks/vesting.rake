namespace :vesting do
  desc "remind user about vesting date of a project"
  task reminder: :environment do
    Vesting.find_each do |vesting|
      if vesting.date.tomorrow?
        pool = vesting.pool
        user = pool.user

        UserMailer.with(user: user, pool: pool, vesting: vesting).remind_vesting_date.deliver
      end
    end
  end
end
