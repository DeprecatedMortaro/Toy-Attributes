class Weapon < ActiveRecord::Base
  string :name, validates: {presence: true}
  integer :min_damage, :max_damage
end
