class User < ApplicationRecord
       
    validates :user_name, presence: true, length: { minimum: 5  }
end
