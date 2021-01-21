class Todo < ActiveRecord::Base
  def self.overdue
    where("due_date < ? and completed = ?", Date.today, false)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
end
