require 'authenticate_module'
class Student < ActiveRecord::Base
  has_and_belongs_to_many :progresses,:class_name => "Structure"
  has_many :knowledge_point_infos
  has_many :knowledge_points, :through => :knowledge_point_infos
  has_many :lack_knowledge_points, :through => :knowledge_point_infos,
    :conditions => ['knowledge_point_infos.level <= ?',10],
    :source => :knowledge_point
  has_many :answered_question_infos
  has_many :questions,:through => :answered_question_infos

  validates :password,:confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  include Authenticate
  def self.authenticate(name,password)
    if student = find_by_name(name)
      if student.hashed_password == Authenticate.encrypt_password(password,student.salt)
        student
      end
    end
  end

end
