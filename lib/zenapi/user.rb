class ZenApi::User
  include ZenApi::Resource
  tag 'user'
  element :name, String
end

