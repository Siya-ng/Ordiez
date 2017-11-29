class Feedback < ApplicationRecord
  belongs_to :ratable, polymorphic: true


  def show_infor
    feedback =
      {
        ratable_id: self.ratable_id,
        ratable_type: self.ratable_type,
        rating: self.rating,
        comment: self.comment
      }
    return feedback
  end

end
