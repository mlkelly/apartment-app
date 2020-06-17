class ApartmentsController < ApplicationController
  # add controller methods
  set :views, "app/views/apartments"

  get '/apartments' do 
    @apartments = Apartment.all
    erb :index
  end

  get '/apartments/new' do
    erb :new
  end

  get '/apartments/:id' do
    @apartment = find_apartment
    erb :show
  end

  post '/apartments' do 
    apartment = Apartment.create(params)
    redirect '/apartments'
  end

  delete '/apartments/:id' do
    apartment = find_apartment
    apartment.destroy
    redirect '/apartments'
  end

  def find_apartment
    Apartment.find(params[:id])
  end
end
