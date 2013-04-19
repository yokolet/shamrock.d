class Page
  include Diametric::Entity
  include Diametric::Persistence::Peer

  attribute :title, String
  attribute :content, String
  attribute :no, Integer, :index => true
end
