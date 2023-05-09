require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(email: "testing@example.com", password:"password", password_confirmation:"password")}
  describe "GET /index" do
    it "it gets a list of apartments" do
    Apartment.create!(
        street: '1st',
        unit: '3',
        city: "San Diego",
        state: 'CA',
        square_footage: 1100,
        price: '1100',
        bedrooms: 3,
        bathroom: 1.5,
        pets: 'yes',
        image: 'duplex.jpeg',
        user_id: user.id
      )

      # Make a request
      get '/apartments'

      apartments = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartments.length).to eq 1
    end  
  end

  describe "POST /create" do
    it "should creates a new apartment" do
      # The Params we are going to send in this request
      apartment_params = {
        apartment: {
          street: '1st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          square_footage: 1100,
          price: '1100',
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      # Send request to the server
      post '/apartments', params: apartment_params

      # Assure that we got a success back
      expect(response).to have_http_status(200)

      # Look up the bot we created in the db
      apartment = Apartment.first

      # Assure that the created bot has the correct attributes
      expect(apartment.street).to eq '1st'
      expect(apartment.unit).to eq '3'
      expect(apartment.city).to eq 'San Diego'
      expect(apartment.state).to eq 'CA'
      expect(apartment.square_footage).to eq 1100
      expect(apartment.price).to eq '1100'
      expect(apartment.bedrooms).to eq 3
      expect(apartment.bathroom).to eq 1.5
      expect(apartment.pets).to eq 'yes'
      expect(apartment.image).to eq 'duplex.jpeg'
      expect(apartment.user_id).to eq user.id
    end

    it "doesn't create an apartmnet without a street" do
      apartment_params = {
        apartment: {
          unit: '3',
          city: "San Diego",
          state: 'CA',
          square_footage: 1100,
          price: '1100',
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['street']).to include "can't be blank"
    end

    it "doesn't create an apartment without a unit" do
      apartment_params = {
        apartment: {
          street: '3',
          city: "San Diego",
          state: 'CA',
          square_footage: 1100,
          price: '1100',
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['unit']).to include "can't be blank"
    end

    it "doesn't create an apartment without a city" do
      apartment_params = {
        apartment: {
          street:'1st',
          unit: '3',
          state: 'CA',
          square_footage: 1100,
          price: '1100',
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['city']).to include "can't be blank"
    end

    it "doesn't create an apartment without square_footage" do
      apartment_params = {
        apartment: {
          street: '1st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          price: '1100',
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['square_footage']).to include "can't be blank"
    end

    it "doesn't create an apartment without a price" do
      apartment_params = {
        apartment: {
          street: '1st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          square_footage: 1100,
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['price']).to include "can't be blank"
    end

    it "doesn't create an apartment without bedrooms" do
      apartment_params = {
        apartment: {
          street: '1st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          price: '1100',
          square_footage: 1100,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['bedrooms']).to include "can't be blank"
    end

    it "doesn't create an apartment without a bathroom" do
      apartment_params = {
        apartment: {
          street: '1st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          price: '1100',
          square_footage: 1100,
          bedrooms: 3,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['bathroom']).to include "can't be blank"
    end

    it "doesn't create an apartment without pets" do
      apartment_params = {
        apartment: {
          street: '1st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          price: '1100',
          square_footage: 1100,
          bedrooms: 3,
          bathroom: 1.5,
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['pets']).to include "can't be blank"
    end

    it "doesn't create an apartment without a user_id" do
      apartment_params = {
        apartment: {
          street: '1st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          price: '1100',
          square_footage: 1100,
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes'
        }
      }

      post '/apartments', params: apartment_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      puts json
      expect(json['user']).to include "must exist"
    end

  describe "PUT /update" do
    it "should update an existing apartment" do
      apartment = Apartment.create(
            street: '1st',
            unit: '3',
            city: "San Diego",
            state: 'CA',
            square_footage: 1100,
            price: '1100',
            bedrooms: 3,
            bathroom: 1.5,
            pets: 'yes',
            image: 'duplex.jpeg',
            user_id: user.id
      )

      apartment_params = {
        apartment: {
          street: '21st',
          unit: '3',
          city: "San Diego",
          state: 'CA',
          square_footage: 1100,
          price: '1100',
          bedrooms: 3,
          bathroom: 1.5,
          pets: 'yes',
          image: 'duplex.jpeg',
          user_id: user.id
        }
      }

      patch "/apartments/#{apartment.id}", params: apartment_params

      expect(response).to have_http_status(200)

      apartment = Apartment.first

      expect(apartment.street).to eq '21st'

    end

    it "should fail to update without proper params" do
      apartment = Apartment.create(
        street: '1st',
        unit: '3',
        city: "San Diego",
        state: 'CA',
        square_footage: 1100,
        price: '1100',
        bedrooms: 3,
        bathroom: 1.5,
        pets: 'yes',
        image: 'duplex.jpeg',
        user_id: user.id
      )

      apartment_params = {
        apartment: {
          street: nil,
          unit: nil,
          city: nil,
          state: nil,
          square_footage: nil,
          price: nil,
          bedrooms: nil,
          bathroom: nil,
          pets: nil,
          image: nil,
          user_id: nil
        }
      }

      patch "/apartments/#{apartment.id}", params: apartment_params
      
      expect(response).to have_http_status(422)
      
      json = JSON.parse(response.body)
      # puts response.body
      expect(json['street']).to include "can't be blank"
      expect(json['unit']).to include "can't be blank"
      expect(json['city']).to include "can't be blank"
      expect(json['state']).to include "can't be blank"
      expect(json['square_footage']).to include "can't be blank"
      expect(json['price']).to include "can't be blank"
      expect(json['bedrooms']).to include "can't be blank"
      expect(json['bathroom']).to include "can't be blank"
      expect(json['pets']).to include "can't be blank"
      expect(json['image']).to include "can't be blank"
      expect(json['user']).to include "must exist"

    end  
  end

  describe "DELETE /destroy" do
    it "should delete an existing apartment" do
      apartment = Apartment.create(
        street: '1st',
        unit: '3',
        city: "San Diego",
        state: 'CA',
        square_footage: 1100,
        price: '1100',
        bedrooms: 3,
        bathroom: 1.5,
        pets: 'yes',
        image: 'duplex.jpeg',
        user_id: user.id
      )

      delete "/apartments/#{apartment.id}"

      expect(response).to have_http_status(200)

    end
  end
end
end