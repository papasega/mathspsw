FactoryGirl.define do
  # Actuality
  factory :actuality do
    title "titre"
    content "contenu"
  end
  
  # Category
  factory :category do
    sequence(:name) { |n| "Categorie #{n}" }
  end
  
  # Chapter
  factory :chapter do
    association :section
    description "Une description"
    sequence(:name) { |n| "Chapitre #{n}" }
    level 1
  end
  
  # Choice
  factory :choice do
    association :qcm
    ans "42"
    ok false
  end
  
  # Color
  factory :color do
    pt 0
    name "Nom"
    femininename "Nom feminin"
    color "#AAAAAA"
    font_color "#BBBBBB"
  end
  
  # Correction
  factory :correction do
    association :submission
    association :user
    content "Foobar"
  end
  
  # Exercise
  factory :exercise do
    association :chapter
    statement "Foobar"
    decimal false
    answer 42
    sequence(:position) { |n| n }
    level 1
    explanation "explication"
  end
  
  # Following
  factory :following do
    association :submission
    association :user
    read false
  end
  
  # Message
  factory :message do
    content "message"
    association :user
    association :subject
  end
  
  # Prerequisite
  factory :prerequisite do
    association :chapter
    association :prerequisite, factory: :chapter
  end
  
  # Problem
  factory :problem do
    statement "Foobar"
    level 1
    online false
  end
  
  # Qcm
  factory :qcm do
    association :chapter
    statement "a"
    sequence(:position) { |n| n }
  end
  
  # Section
  factory :section do
    sequence(:name) { |n| "Section#{n}" }
    description "Description"
  end
  
  # Solved exercise
  factory :solvedexercise do
    association :exercise
    association :user
    correct false
    guess 42
    nb_guess 1
  end
  
  # Solved problem
  factory :solvedproblem do
    association :problem
    association :user
  end
  
  # Subject
  factory :subject do
    title "Titre"
    content "Contenu"
    association :user
    lastcomment DateTime.current
    association :category
    chapter_id 0
    section_id 0
    qcm_id 0
    exercise_id 0
    factory :admin_subject do
      admin true
    end
    factory :important_subject do
      important :false
    end
  end
  
  # Submission
  factory :submission do
    association :problem
    association :user
    content "Foobar"
  end
  
  # Theory
  factory :theory do
    association :chapter
    title "titre"
    content "contenu"
    sequence(:position) { |n| n }
  end
  
  # User
  factory :user do
    sequence(:first_name) { |n| "Jean#{(("a".."z").to_a)[(n/26).to_i]}#{(("a".."z").to_a)[n%26]}" }
    sequence(:last_name) { |n| "Dupont" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    country "Belgique" 
    year 1992
    rating 0
    password "foobar"
    password_confirmation "foobar"
    factory :admin do
      admin true
      root false
    end
    factory :root do
      admin true
      root true
    end
  end
  
  # Virtualtest
  factory :virtualtest do
    duration 120
    number 25
    online false
  end
end
