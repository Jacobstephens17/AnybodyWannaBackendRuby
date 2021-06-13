class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :location, :group, :slug
end
