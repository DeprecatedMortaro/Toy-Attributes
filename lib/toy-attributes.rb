module ToyAttributes
  COLUMN_TYPES = [:string, :text, :integer, :float, :decimal, :datetime, :timestamp, :time, :date, :binary, :boolean, :references]
end

require "active_record"

require "toy-attributes/methods"
require "toy-attributes/observer"
require "toy-attributes/relations"

require "toy-attributes/railtie" if defined? Rails
