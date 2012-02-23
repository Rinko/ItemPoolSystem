class Structure < ActiveRecord::Base
  has_and_belongs_to_many :knowledge_points
  has_and_belongs_to_many :students
  belongs_to :book
#  acts_as_tree
#  添加时按章节展开
#  acts_as_list :scope => :book, :column => "unit,chapter"
#  以多字段排序似乎遇到了问题，留作性能提升
#  考虑 1：修改插件 2：新增排序字段

  def self.query_progress_by(student_id,question)
    joins(:students,:book).where(
      "books.subject = #{question.knowledge_points.first.structures.first.book.subject} AND students.id = #{student_id}").first
  end
end
