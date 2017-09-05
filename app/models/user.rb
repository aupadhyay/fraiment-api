class User < ApplicationRecord
  has_secure_password

  def as_json(options={})
    super(:only => [:id, :username, :email])
  end
end
