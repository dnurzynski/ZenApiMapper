require 'happymapper'
require 'httparty'
require 'active_model'

class ZenApi
  autoload :Resource, 'zenapi/resource'
  autoload :User, 'zenapi/user'
  autoload :Owner, 'zenapi/owner'
  autoload :Project, 'zenapi/project'
  autoload :Board, 'zenapi/board'
  autoload :Story, 'zenapi/story'
  autoload :Phase, 'zenapi/phase'
end
