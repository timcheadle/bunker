FactoryGirl.define do
  factory :bottle do
    name "Test Whiskey"
    type "bourbon"
    volume 750
    proof "120.5"
    released 2014
    price 3500
    acquired_on "2015-01-14"
    box "EX1"
    notes "Tastes great, less filling"
    score 90
    tradable false
    sellable false
    stocked true
    open false
    finished false
  end
end
