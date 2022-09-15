module Users
  class AssignRole
    def self.call(user, role = 'instructor')
      user.roles.destroy_all
      user.roles << Role.find_by(name: role)

      user
    end 
  end
end