class Nutrient < ApplicationRecord
  belongs_to :food

  def as_json(opts={})
    super(only: %w{name level})
  end
end
