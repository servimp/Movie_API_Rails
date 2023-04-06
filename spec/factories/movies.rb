require 'faker'


FactoryBot.define do
    factory :movie do
      name { Faker::Movie.title }
      preview_video_url { Faker::Internet.url }
      runtime { rand(60..180) }
      synopsis { Faker::Lorem.paragraph }
      avg_score { rand(0..100) }
  
      trait :with_genres do
        transient do
          genres_count { 3 }
        end
  
        after(:create) do |movie, evaluator|
          create_list(:genre, evaluator.genres_count, movie: movie)
        end
      end
  
      trait :with_scores do
        transient do
          scores_count { 3 }
        end
  
        after(:create) do |movie, evaluator|
          create_list(:score, evaluator.scores_count, movie: movie)
        end
      end
    end
  
    factory :genre do
      name { Faker::Book.genre }
      movie
    end
  
    factory :score do
      score { rand(0..100) }
      user_id { Faker::Number.unique.number(digits: 6) }
      movie
    end
  end
  