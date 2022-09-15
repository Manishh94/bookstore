class AddBookCourseJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :courses do |t|
      t.index [:book_id, :course_id], unique: true
      t.index [:course_id, :book_id]
    end
  end
end
