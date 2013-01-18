require 'spec_helper'

describe ToyAttributes::Observer do

  it "creates table for new models" do
    Warrior.table_exists?.should == true
  end

  it "creates the correct column_type" do
    Weapon.columns_hash['name'].type.should == :string
    Weapon.columns_hash['min_damage'].type.should == :integer
    Weapon.columns_hash['max_damage'].type.should == :integer
  end

  it "changes the column type" do
    Warrior.text :story
    Warrior.columns_hash['story'].type.should == :text
  end

end
