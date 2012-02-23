class KnowledgePoint < ActiveRecord::Base
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :structures
  has_many :knowledge_point_infos
  has_many :students,:through => :knowledge_point_infos
end
