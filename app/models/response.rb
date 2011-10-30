class Response
  include Mongoid::Document

  field :is_coming
  field :name
  field :email
  field :comments
  embedded_in :event
end
