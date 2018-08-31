class Food < ApplicationRecord
  has_many :nutrients

  JSON_KEYS = %w{ret_code food_grp_code ret_desc}
  def as_json(opts = {})
    super(:only => JSON_KEYS, :methods => [:jsonified_nutrients])
  end

  def jsonified_nutrients
    self.nutrients.map{|nutrient| nutrient.slice(:name, :level)}
  end
end
