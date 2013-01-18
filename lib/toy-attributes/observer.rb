module ToyAttributes::Observer

  def self.watch! column_name, column_type, model, options={}
    assert_existence_of_table(model)
    assert_existence_of_column(column_name, column_type, model)
    model.reset_column_information
    model.attr_accessible column_name
  end

  def self.assert_existence_of_table model
    unless ActiveRecord::Base.connection.table_exists? model.table_name
      Class.new(ActiveRecord::Migration).create_table(model.table_name.to_sym) { |t| t.timestamps }
    end
  end

  def self.assert_existence_of_column column_name, column_type, model
    add_column_to_table(column_name, column_type, model)
    update_table_column(column_name, column_type, model)
  end

  def self.add_column_to_table column_name, column_type, model
    unless model.columns_hash[column_name.to_s]
      Class.new(ActiveRecord::Migration).add_column model.table_name.to_sym, column_name, column_type
    end
  end

  def self.update_table_column column_name, column_type, model
    if model.columns_hash[column_name.to_s] && model.columns_hash[column_name.to_s].type != column_type
      Class.new(ActiveRecord::Migration).change_column model.table_name, column_name, column_type
    end
  end

end
