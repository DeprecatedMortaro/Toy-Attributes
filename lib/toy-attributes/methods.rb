module ToyAttributes::Methods

  ToyAttributes::COLUMN_TYPES.each do |column_type|
    define_method column_type do |*args|
      options = args.extract_options!
      args.each { |column_name| ToyAttributes::Observer.watch! column_name, column_type, self, options }
    end
  end

end

ActiveRecord::Base.extend ToyAttributes::Methods
