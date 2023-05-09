require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(email: "testing@example.com", password:"password", password_confirmation:"password")}

  it "should have a valid street" do
    apartment = user.apartments.create(
      unit: '33',
      city: 'Portland',
      state: 'Oregon',
      square_footage: 1100,
      price: '1100',
      bedrooms: 2,
      bathroom: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:street]).to include("can't be blank")
  end
  it "should have a valid unit" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      city: 'Portland',
      state: 'Oregon',
      square_footage: 1100,
      price: '1100',
      bedrooms: 2,
      bathroom: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:unit]).to include("can't be blank")
  end
  it "should have a valid city" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: 'Portland',
      state: 'Oregon',
      square_footage: 1100,
      price: '1100',
      bedrooms: 2,
      bathroom: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:city]).to include("can't be blank")
  end
  it "should have a valid state" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: 'Portland',
      city: 'Oregon',
      square_footage: 1100,
      price: '1100',
      bedrooms: 2,
      bathroom: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:state]).to include("can't be blank")
  end
  it "should have a valid square footage" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: '1034',
      city: 'Portland',
      state: 'Oregon',
      price: '1100',
      bedrooms: 2,
      bathroom: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:square_footage]).to include("can't be blank")
  end
  it "should have a valid price" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: '1034',
      city: 'Portland',
      state: 'Oregon',
      square_footage: '1100',
      bedrooms: 2,
      bathroom: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:price]).to include("can't be blank")
  end
  it "should have a valid bedrooms" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: '1034',
      city: 'Portland',
      state: 'Oregon',
      square_footage: '1100',
      price: "100",
      bathroom: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end
  it "should have a valid bathroom" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: '1034',
      city: 'Portland',
      state: 'Oregon',
      square_footage: '1100',
      price: "100",
      bedrooms: 2,
      pets: 'yes',
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:bathroom]).to include("can't be blank")
  end
  it "should have a valid pets" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: '1034',
      city: 'Portland',
      state: 'Oregon',
      square_footage: '1100',
      price: "100",
      bathroom: 2,
      bedrooms: 2,
      image: 'https://cdn.pixabay.com/photo/2014/07/05/08/33/row-houses-384596__340.jpg'
      )
      expect(apartment.errors[:pets]).to include("can't be blank")
  end
  it "should have a valid image" do
    apartment = user.apartments.create(
      street: '234 Pig lane',
      unit: '1034',
      city: 'Portland',
      state: 'Oregon',
      square_footage: '1100',
      price: "100",
      bathroom: 2,
      pets: 'yes',
      bedrooms: 2,
      )
      expect(apartment.errors[:image]).to include("can't be blank")
  end

end
