class Movie < ApplicationRecord
  include PgSearch::Model

  multisearchable against: [:title, :synopsis]
  
  pg_search_scope :search_by_title_and_sinopsys,
    against: [ :title, :synopsis ],
    associated_against: {
    director: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  belongs_to :director
end
