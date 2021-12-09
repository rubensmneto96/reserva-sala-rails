FactoryBot.define do
    factory :booking do
        full_name {'Full Name'}
        email {'Email'}
        room {'Room Name'}
        date {DateTime.now}
        user_id {'User ID'}
    end
end