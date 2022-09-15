require 'sidekiq-scheduler'

class SeedUserDetails
  include Sidekiq::Worker

  def perform
    create_instructor
    build_course
    build_books

    15.times do
      student = Users::Create.call(Faker::Name.unique.name, Faker::Internet.email)
      Users::AssignRole.call(student, 'student')
      @book.reading_times.build(user: student, minutes_spend: rand(Constants::RANDOM_READING_TIME_MINUTES))
    end

    @user.save!
  end

  private

  def create_instructor
    @user = Users::Create.call(Faker::Name.unique.name, Faker::Internet.email)
    Users::AssignRole.call(@user, 'instructor')
  end

  def build_course
    @course = @user.courses.build(name: Faker::Name.unique.name)
  end

  def build_books
    @book = @course.books.build(title: Faker::Name.name, content: Faker::Lorem.paragraph)
  end
end
