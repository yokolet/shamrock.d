require 'diametric'

uri = "datomic:free://localhost:4334/shamrock"
Diametric::Persistence::Peer.create_database(uri)
Diametric::Persistence::Peer.connect(uri)

