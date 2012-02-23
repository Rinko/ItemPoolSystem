class Parameter < ActiveRecord::Base
  acts_as_tree  :order => "key"
end
