require 'spec_helper'

describe Warrior do
  subject { Warrior }
  ToyAttributes::COLUMN_TYPES.each {|column_type| it { should respond_to(column_type) } }
end
