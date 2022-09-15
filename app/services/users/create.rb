module Users
  class Create
    def self.call(name, email)
      user = User.find_or_initialize_by(email: email)
      user.name = name
      user.save! && user
    end
  end
end
