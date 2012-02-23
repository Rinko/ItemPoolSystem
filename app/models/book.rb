class Book < ActiveRecord::Base
  has_many :structures, :order => "unit,chapter"
#  acts_as_list 应该是按publisher+subject分块 以garde+term从小到大排序
end
