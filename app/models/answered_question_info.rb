class AnsweredQuestionInfo < ActiveRecord::Base
  belongs_to :student
  belongs_to :question
end
