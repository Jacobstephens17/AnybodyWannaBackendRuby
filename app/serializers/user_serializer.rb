class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password, :slug
end
