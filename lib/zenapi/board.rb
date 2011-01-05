class ZenApi::Board
  include HTTParty
  base_uri 'https://agilezen.com/api/v1/'

  default_params :apikey => '123'

  attr_accessor :default_params

  def initialize(args={})
    self.default_params = { :query => {} }
    args.each {|k,v| self.send("#{k.to_s}=", v)}
  end

  def apikey=(key)
    self.default_params[:query].merge!(:apikey => key)
  end

  def projects
    @projects ||= ZenApi::Project.parse self.class.get(:projects).response.body
  end

  def self.get(path, args={})
    super "/#{path.to_s}", args
  end
end
