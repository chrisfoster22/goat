class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys


  def self.email(email)
    select("*").
    where("email = " + '"' + "#{email}" + '"').
    all
  end

  def self.most_recent
    select("name").
    order(id: :desc).
    first
  end

  def self.most_recent
    Author.order(created_at: :desc).first
  end

  def self.with_survey_titles
    joins(:surveys).
    select("surveys.title AS title, authors.email AS name").
    order("surveys.id").
    all
  end

  def self.without_surveys
    select("*")
    where("id NOT IN (
    SELECT authors.id
    FROM surveys
    )").
    all
  end
end
