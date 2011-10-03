class Post
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String
  property :body,       Text

  # Values are automatically filled in by Datamapper
  property :created_at, DateTime
  property :updated_at, DateTime
end