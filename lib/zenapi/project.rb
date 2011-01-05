class ZenApi::Project
  include ZenApi::Resource
  tag 'project'

  element :name, String
  element :description, String
  element :createTime, DateTime
  has_one :owner, ZenApi::Owner
  has_many :members, ZenApi::User
  has_many :phases, ZenApi::Phase

  def stories
    ZenApi::Story.parse ZenApi::Board.get(path+'stories').response.body
  end

end
