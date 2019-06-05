require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }


    get '/' do
        erb :super_hero
    end

    post '/team' do
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]
        @team_members = params[:team][:heroes]
        @hero_name = []
        @hero_power = []
        @hero_biography = []
        @team_members.each do |hero|
            @hero_name << hero[:name]
            @hero_power << hero[:power]
            @hero_biography << hero[:biography]
        end

        erb :team
    end
    
end
