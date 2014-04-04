class WishMill

  def initialize(period)
    @period = period
    raise 'Period passed to mill is not a period object' unless period.kind_of? Period
  end


end