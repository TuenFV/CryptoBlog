module PoolsHelper
  def pool_profit(pool)
    profit = 0
    @pool = pool
    pool.vestings.each do |vesting|
      profit += vesting.return unless vesting.return.nil?
    end
    pool.amount.nil? ? 0 : (profit - pool.amount).round(0)
  end
end
