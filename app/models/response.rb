class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission

  def self.most_common
    select("response_text").
    group("question_id").
    order("response_text").
    count.
    first
  end

end







# def self.most_common(question_id)
#   questions = Question.all
#   response_array = []
#   question = questions.find_by_id(question_id)
#   responses = question.responses
#   responses.each do |r|
#     response_array << r.response_text
#   end
#   response_array.max_by{ |x| response_array.count(x) }
# end
