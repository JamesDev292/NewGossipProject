class GossipsController < ApplicationController
    def index
        @gossip = Gossip.all
    end

    def new
        @gossip = Gossip.new
    end

    def create
        @gossip = Gossip.create(
          content: params["gossip_content"],
          title: params["gossip_title"],
          user_id: current_user.id
        ) # avec xxx qui sont les donnees obtenues a partir du formulaire
        if @gossip.save # essaie de sauvegarder en base @gossip
          redirect_to gossips_path, notice: "Gossip cree avec succes."
        else
         render :new
        end
    end

    def edit
        @gossip = Gossip.find(params[:id])
    end
    
    def show
        @gossip = Gossip.find(params[:id])
    end
    

end
