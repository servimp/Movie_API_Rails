class Movie < ApplicationRecord
    has_many :genres
    has_many :scores
  
    validates :name, presence: true
    validates :preview_video_url, presence: true
    validates :runtime, presence: true
    validates :synopsis, presence: true
    validates :avg_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  
    def self.search(movie_ids)
        if movie_ids.present?
          where(id: movie_ids.split(','))
        else
          all
        end
      end
  
    accepts_nested_attributes_for :genres, allow_destroy: true
  end
  
  class Genre < ApplicationRecord
    belongs_to :movie
  
    validates :name, presence: true
  end
  
  class Score < ApplicationRecord
    belongs_to :movie
  
    validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :user_id, presence: true
  end
  