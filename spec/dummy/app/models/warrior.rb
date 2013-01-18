class Warrior < ActiveRecord::Base
  string :name, :story
  has_many :weapons
end
