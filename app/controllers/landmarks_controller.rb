class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do #index
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do #new
    erb :"/landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.create(:name => params[:landmark][:name], :year_completed =>params[:landmark][:year_completed] )
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end


  get '/landmarks/:id' do #show
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end


end
