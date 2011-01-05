module ZenApi::Resource
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
    base.send :include, HappyMapper
    base.send :include, ActiveModel::Validations
    base.send :extend, ActiveModel::Callbacks

    base.send :element, :id, Integer

    base.class_eval do
     define_model_callbacks :save
    end
  end

  module InstanceMethods
    def get(resource, args={})
      ZenApi::Board.get("#{path}/#{resource}",args).response.body
    end

    def path
      "#{self.class.class_name}/#{self.id}/"
    end
  end

  module ClassMethods

    def find(id, args={})
      parse ZenApi::Board.get("#{class_name}/#{id}", args).response.body
    end

    def class_name
      @class_name ||= to_s.gsub(/ZenApi::/,'').to_s.downcase
    end
  end

end
