module ToyAttributes

  def self.load! dir_path
    Dir[dir_path].each { |file| load file }
  end

  class Engine < Rails::Engine
    config.to_prepare { ToyAttributes.load! "#{Rails.root}/app/models/*.rb" }
  end

end
