class Application < ApplicationRecord
  belongs_to :user
  has_many :responses, :dependent => :destroy
end
