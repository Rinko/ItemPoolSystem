# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# encoding: utf-8
@parameter_root = Parameter.create(
  :value => "root",
  :parent_id => 0
)
@grade = @parameter_root.children.create(:value => "grade")
@grade.children.create(:key => 1, :value => "小学一年级")
@grade.children.create(:key => 2, :value => "小学二年级")
@grade.children.create(:key => 3, :value => "小学三年级")
@grade.children.create(:key => 4, :value => "小学四年级")
@grade.children.create(:key => 5, :value => "小学五年级")
@grade.children.create(:key => 6, :value => "小学六年级")
@grade.children.create(:key => 7, :value => "初中一年级")
@grade.children.create(:key => 8, :value => "初中二年级")
@grade.children.create(:key => 9, :value => "初中三年级")
@grade.children.create(:key => 10, :value => "高中一年级")
@grade.children.create(:key => 11, :value => "高中二年级")
@grade.children.create(:key => 12, :value => "高中三年级")

@subject = @parameter_root.children.create(:value => "subject")
@subject.children.create(:key => 1,:value => "语文")
@subject.children.create(:key => 2,:value => "数学")
@subject.children.create(:key => 3,:value => "英语")

@term = @parameter_root.children.create(:value => "term")
@term.children.create(:key => 0,:value => "上学期")
@term.children.create(:key => 1,:value => "下学期")

@knowledge_point1 = KnowledgePoint.create(
  :specific => "集合的运算"
)
@knowledge_point2 = KnowledgePoint.create(
  :specific => "函数奇偶性"
)
@knowledge_point3 = KnowledgePoint.create(
  :specific => "收敛数列性质"
)
@knowledge_point4 = KnowledgePoint.create(
  :specific => "导数几何意义"
)
@knowledge_point5 = KnowledgePoint.create(
  :specific => "反函数"
)
@knowledge_point6 = KnowledgePoint.create(
  :specific => "复合函数"
)
@knowledge_point7 = KnowledgePoint.create(
  :specific => "向量的模"
)
@knowledge_point8 = KnowledgePoint.create(
  :specific => "多元函数极限"
)
@knowledge_point9 = KnowledgePoint.create(
  :specific => "多元函数连续性"
)
@knowledge_point10 = KnowledgePoint.create(
  :specific => "偏导数定义"
)

@question1 = Question.create(
  :question => "问题内容一",
  :answer => "1",
  :resource_ids => "",
  :difficulty => 3,
  :if_judge => true
)
@question1.knowledge_points << @knowledge_point1
@question1.knowledge_points << @knowledge_point2

@question2 = Question.create(
  :question => "问题内容二",
  :answer => "2",
  :resource_ids => "",
  :difficulty => 5,
  :if_judge => true
)
@question2.knowledge_points << @knowledge_point1

@question3 = Question.create(
  :question => "问题内容三",
  :answer => "3",
  :resource_ids => "",
  :difficulty => 8,
  :if_judge => true
)
@question3.knowledge_points << @knowledge_point2

@question4 = Question.create(
  :question => "问题内容四",
  :answer => "1",
  :resource_ids => "",
  :difficulty => 9,
  :if_judge => true
)
@question4.knowledge_points << @knowledge_point3

@question5 = Question.create(
  :question => "问题内容五",
  :answer => "1",
  :resource_ids => "",
  :difficulty => 6,
  :if_judge => true
)
@question5.knowledge_points << @knowledge_point2
@question5.knowledge_points << @knowledge_point3

@question6 = Question.create(
  :question => "问题内容六",
  :answer => "4",
  :resource_ids => "",
  :difficulty => 2,
  :if_judge => true
)
@question6.knowledge_points << @knowledge_point3
@question6.knowledge_points << @knowledge_point4
@question6.knowledge_points << @knowledge_point5
@question6.knowledge_points << @knowledge_point6

@question7 = Question.create(
  :question => "问题内容七",
  :answer => "1",
  :resource_ids => "",
  :difficulty => 4,
  :if_judge => true
)
@question7.knowledge_points << @knowledge_point4

@question8 = Question.create(
  :question => "问题内容八",
  :answer => "2",
  :resource_ids => "",
  :difficulty => 1,
  :if_judge => true
)
@question8.knowledge_points << @knowledge_point5

@question9 = Question.create(
  :question => "问题内容⑨",
  :answer => "4",
  :resource_ids => "",
  :difficulty => 5,
  :if_judge => true
)
@question9.knowledge_points << @knowledge_point5

@question10 = Question.create(
  :question => "问题内容十",
  :answer => "1",
  :resource_ids => "",
  :difficulty => 7,
  :if_judge => true
)
@question10.knowledge_points << @knowledge_point6
@question10.knowledge_points << @knowledge_point7

@question11 = Question.create(
  :question => "问题内容十一",
  :answer => "2",
  :resource_ids => "",
  :difficulty => 9,
  :if_judge => true
)
@question11.knowledge_points << @knowledge_point7

@question12 = Question.create(
  :question => "问题内容十二",
  :answer => "1",
  :resource_ids => "",
  :difficulty => 8,
  :if_judge => true
)
@question12.knowledge_points << @knowledge_point8

@question13 = Question.create(
  :question => "问题内容十三",
  :answer => "4",
  :resource_ids => "",
  :difficulty => 1,
  :if_judge => true
)
@question13.knowledge_points << @knowledge_point9

@question14 = Question.create(
  :question => "问题内容十四",
  :answer => "2",
  :resource_ids => "",
  :difficulty => 4,
  :if_judge => true
)
@question14.knowledge_points << @knowledge_point9

@question15 = Question.create(
  :question => "问题内容十五",
  :answer => "1",
  :resource_ids => "",
  :difficulty => 5,
  :if_judge => true
)
@question15.knowledge_points << @knowledge_point9

@question16 = Question.create(
  :question => "问题内容十六",
  :answer => "4",
  :resource_ids => "",
  :difficulty => 7,
  :if_judge => true
)
@question16.knowledge_points << @knowledge_point10

@book1 = Book.create(
  :subject => 2,
  :grade => 1,
  :term => 0,
  :title => "高等数学（上）"
)
@book2 = Book.create(
  :subject => 2,
  :grade => 1,
  :term => 1,
  :title => "高等数学（下）"
)
#@structure_root = Structure.create(
#  :title => "root"
#)
@structure1 = Structure.create(
  :unit => 1,
  :chapter => 1,
  :title => "映射与函数",
  :weight => 1
)
@book1.structures << @structure1
@structure1.knowledge_points << @knowledge_point1
@structure1.knowledge_points << @knowledge_point2

@structure2 = Structure.create(
  :unit => 1,
  :chapter => 2,
  :title => "数列的极限",
  :weight => 2
)
@book1.structures << @structure2
@structure2.knowledge_points << @knowledge_point3

@structure3 = Structure.create(
  :unit => 2,
  :chapter => 1,
  :title => "导数与微分",
  :weight => 5
)
@book1.structures << @structure3
@structure3.knowledge_points << @knowledge_point4

@structure4 = Structure.create(
  :unit => 2,
  :chapter => 2,
  :title => "函数求导法则",
  :weight => 3
)
@book1.structures << @structure4
@structure4.knowledge_points << @knowledge_point5
@structure4.knowledge_points << @knowledge_point6

@structure5 = Structure.create(
  :unit => 1,
  :chapter => 1,
  :title => "向量及其线性运算",
  :weight => 2
)
@book2.structures << @structure5
@structure5.knowledge_points << @knowledge_point7

@structure6 = Structure.create(
  :unit => 2,
  :chapter => 1,
  :title => "多元函数基本概念",
  :weight => 2
)
@book2.structures << @structure6
@structure6.knowledge_points << @knowledge_point8
@structure6.knowledge_points << @knowledge_point9

@structure7 = Structure.create(
  :unit => 2,
  :chapter => 2,
  :title => "偏导数",
  :weight => 5
)
@book2.structures << @structure7
@structure7.knowledge_points << @knowledge_point10

@student1 = Student.create(
  :name => "学生一"
)
@student1.progresses << @structure5

#@answered_question_info1 = @student1.answered_question_infos.create(
#  :right_or_wrong => false,
#  :wrong_answer => "1"
#)
#@question1.answered_question_infos << @answered_question_info1

@knowledge_point_info1 = @student1.knowledge_point_infos.create(
  :level => 5
)
@knowledge_point1.knowledge_point_infos << @knowledge_point_info1

@knowledge_point_info2 = @student1.knowledge_point_infos.create(
  :level => 7
)
@knowledge_point2.knowledge_point_infos << @knowledge_point_info2

@knowledge_point_info3 = @student1.knowledge_point_infos.create(
  :level => 4
)
@knowledge_point3.knowledge_point_infos << @knowledge_point_info3

@knowledge_point_info4 = @student1.knowledge_point_infos.create(
  :level => 2
)
@knowledge_point4.knowledge_point_infos << @knowledge_point_info4

@knowledge_point_info5 = @student1.knowledge_point_infos.create(
  :level => 2
)
@knowledge_point5.knowledge_point_infos << @knowledge_point_info5

@knowledge_point_info6 = @student1.knowledge_point_infos.create(
  :level => 8
)
@knowledge_point6.knowledge_point_infos << @knowledge_point_info6

@knowledge_point_info7 = @student1.knowledge_point_infos.create(
  :level => 9
)
@knowledge_point7.knowledge_point_infos << @knowledge_point_info7
