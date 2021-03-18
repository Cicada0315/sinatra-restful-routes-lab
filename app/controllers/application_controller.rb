class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    if recipe=Recipe.create(:name=> params[:name] , :ingredients=> params[:ingredients], :cook_time=> params[:cook_time])
      redirect "/recipes/#{recipe.id}"
    else
      redirect '/recipes/new'
    end
  end

  get '/recipes/:id' do
    @recipe=Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
    if @recipe.update(:name=> params[:name] , :ingredients=> params[:ingredients], :cook_time=> params[:cook_time])
      redirect "/recipes/#{recipe.id}"
    else
      redirect "/recipes/#{recipe.id}/edit"
    end
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end


end
