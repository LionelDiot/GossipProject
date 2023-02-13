class WelcomeController < ApplicationController
  def show

      puts "$"*60
      puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans tel champ : #{params["name"]}"
      puts "$"*60

  end
end
