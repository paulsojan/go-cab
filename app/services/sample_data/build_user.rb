# frozen_string_literal: true

module SampleData
  class BuildUser
    def process!
      create_user!
    end

    private

      def create_user!
        user_attributes = {
          first_name: "Oliver",
          last_name: "Smith",
          email: "oliver@example.com",
          password: "welcome"
        }
        User.create! user_attributes
      end
  end
end
