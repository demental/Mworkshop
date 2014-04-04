class Assignment
  include Mongoid::Document
  include Mongoid::MagicCounterCache

  field :locked, type: Mongoid::Boolean

  belongs_to :student
  belongs_to    :workshop
  counter_cache :workshop
  belongs_to :period


end
