class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

    # Converts email to all lower-case.
    def downcase_email
      if self.email
        self.email.downcase!
      end
    end
end
