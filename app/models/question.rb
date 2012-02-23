class Question < ActiveRecord::Base
  has_and_belongs_to_many :knowledge_points
  has_many :answered_question_infos
  has_many :students,:through => :answered_question_infos
end
