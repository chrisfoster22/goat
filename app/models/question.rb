class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :question_text, presence: true

  accepts_nested_attributes_for :options,
      :allow_destroy => true,
      :reject_if     => :all_blank




  def self.questions
    Question.all
  end

  def self.question_type_count
    select("question_type").
    group("question_type").
    count
  end
  


    #
    # def self.question_types
    #   types = []
    #   questions.each do |q|
    #     type = q.question_type
    #     if !types.include?(type)
    #       types << type
    #     end
    #   end
    #   types
    # end


  # def self.question_type_count
  #   question_types.each do |t|
  #     puts questions.where(question_type: t).length
  #   end
  # end

end
