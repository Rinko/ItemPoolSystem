class KnowledgePointInfo < ActiveRecord::Base
  belongs_to :student
  belongs_to :knowledge_point

  def self.query_knowledge_point_infos_by(student_id,question_id)
    joins(:student,{:knowledge_point => :questions}).where("questions.id = #{question_id} AND students.id = #{student_id}")
  end

end
