user1 = User.where(email: "testing1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "testing2@example.com").first_or_create(password: "password", password_confirmation: "password")

apartments1 = [
{
    street: '2346 Elm Street',
    unit: '33',
    city: 'Portland',
    state: 'Oregon',
    square_footage: 1100,
    price: '1100',
    bedrooms: 2,
    bathrooms: 2,
    pets: 'yes!'
    image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'

},
{
    street: '6734 Cow Avenue',
    unit: '1024',
    city: 'Portland',
    state: 'Oregon',
    square_footage: 900,
    price: '1000',
    bedrooms: 1,
    bathrooms: 2,
    pets: 'yes!'
    image: 'https://cdn.pixabay.com/photo/2015/07/08/10/29/appartment-building-835817__340.jpg'
}
]
apartments1 = [
{
    street: '2976 Pig Lane',
    unit: '2365',
    city: 'Portland',
    state: 'Oregon',
    square_footage: 1300,
    price: '1500',
    bedrooms: 2,
    bathrooms: 2,
    pets: 'no'
    image: 'https://cdn.pixabay.com/photo/2018/03/27/15/28/architecture-3266317__340.jpg'

},
{
    street: '342 Sheep Street',
    unit: '1074',
    city: 'Portland',
    state: 'Oregon',
    square_footage: 700,
    price: '800',
    bedrooms: 1,
    bathrooms: 1,
    pets: 'no'
    image: 'https://cdn.pixabay.com/photo/2021/03/07/17/02/construction-6076879__340.jpg'
}
]

apartments1.each do |apartment|
    user1.apartments.create(apartment)
    puts "creating: #{apartment}"
end

apartments2.each do |apartment|
    user2.apartments.create(apartment)
    puts "creating: #{apartment}"
end