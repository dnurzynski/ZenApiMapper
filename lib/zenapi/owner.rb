class ZenApi::Owner < ZenApi::User
  include ZenApi::Resource

  tag 'owner'
  element :name, String

  validates :name, :presence => true

end
