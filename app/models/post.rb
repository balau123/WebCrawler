class Post < ApplicationRecord

def getCategory(category, limit)
	sql='select * from posts where category=`'+category+'` order by created_at desc limit '+limit+';'
	results = ActiveRecord::Base.connection.execute(sql)
end



end
