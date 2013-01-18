require 'spec_helper'

describe Warrior do
  it { should respond_to(:weapons_attributes=) }
  it { should have_many(:weapons) }
end

describe Weapon do
  it { should belong_to(:warrior) }
  it { should respond_to(:warrior_id) }
end
