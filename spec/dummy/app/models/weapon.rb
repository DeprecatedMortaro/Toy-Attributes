class Weapon < ActiveRecord::Base
  string :name
  integer :min_damage, :max_damage
  integer :grade, default: 1
end
