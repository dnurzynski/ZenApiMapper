class ZenApi::Story
  include ZenApi::Resource
  tag 'story'

  attr_accessor :project_id

  element :blocked, Boolean
  element :ready, Boolean
  element :color, String
  element :text, String
  element :size, String
  element :phase_index, Integer, :tag => 'phaseIndex'

  has_one :owner, 'ZenApi::User'
  has_one :creator, 'ZenApi::User'
  has_one :phase, 'ZenApi::Phase'


  def path
    "#{self.class.class_name}/#{self.project_id}/#{self.id}/"
  end
end

