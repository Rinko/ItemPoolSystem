# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #辅助方法先放全局，功能完成后再按需要安排
  def get_parameters_value_by_key(scope,key)
    parent = Parameter.find_by_value(scope)
    parameter = Parameter.find_by_parent_id_and_key(parent.id,key)
    parameter.value
  end

  def get_parameters_values(scope)
    parent = Parameter.find_by_value(scope)
    Parameter.find_all_by_parent_id(parent.id).collect{|p|[p.value,p.key]}
  end
end
class ParamterScope
    SUBJECT = "subject"
    GRADE = "grade"
    TERM = "term"
end