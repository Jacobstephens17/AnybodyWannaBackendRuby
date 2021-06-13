class User < ApplicationRecord
    before_create :slugify
    
    def slugify
        self.slug = username.parameterize
    end
end
