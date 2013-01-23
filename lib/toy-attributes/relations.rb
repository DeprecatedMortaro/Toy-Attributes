module ToyAttributes::Relations

  def self.included base
    base.instance_eval do

      alias :_has_many :has_many
      alias :_has_one :has_one

      def has_many *models
        options = models.extract_options!
        models.each do |model|
          self._has_many model, options
          enforce_relation_with model
        end
      end

      def has_one model
        self._has_one model
        enforce_relation_with model
      end

      private

      def enforce_relation_with model
        related = model.to_s.singularize.classify.constantize
        symbol = to_s.underscore.to_sym
        related.integer :"#{symbol}_id"
        related.belongs_to symbol
        accepts_nested_attributes_for model
        attr_accessible :"#{model}_attributes"
      end

    end
  end

end

ActiveRecord::Base.send :include, ToyAttributes::Relations
