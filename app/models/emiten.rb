class Emiten
  include Mongoid::Document
  include Mongoid::Timestamps
  field :code, type: String
  field :name, type: String
  field :eipo_id, type: Integer
  field :link, type: String
  field :status, type: String


  validates_uniqueness_of :code, :eipo_id
end
