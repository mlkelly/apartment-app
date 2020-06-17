class TenantsController < ApplicationController
  # add controller methods
  set :views, "app/views/tenants"

  get '/tenants' do 
    @tenants = Tenant.all
    erb :index
  end

  post '/tenants' do 
    tenant = Tenant.create(params)
    redirect '/tenants'
  end

  get '/tenants/new' do
    @apartments = Apartment.all
    erb :new
  end

  delete '/tenants/:id' do
    tenant = find_tenant
    tenant.destroy
    redirect '/tenants'
  end

  get '/tenants/:id/edit' do
    @tenant = find_tenant
    @apartments = Apartment.all

    erb :edit
  end

  get '/tenants/:id' do
    @tenant = find_tenant
    erb :show
  end

  patch '/tenants/:id' do
    @tenant = find_tenant
    @tenant.update(params)

    redirect "/tenants/#{@tenant.id}"
  end

  def find_tenant
    Tenant.find(params[:id])
  end
end
