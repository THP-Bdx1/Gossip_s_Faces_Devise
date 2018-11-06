class GossipsController < ApplicationController

  def index
  @gossips=Gossip.all
  @users=User.all
  end

  def show
    @gossip=Gossip.find(params[:id])
  end

  def update
    @gossip=Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to "/gossips/"
  end

  def destroy
    @gossip=Gossip.find(params[:id])
    @gossip.destroy
    redirect_to "/gossips/"
  end

  def new
    @gossip = Gossip.new
  end

  def edit
    @gossip=Gossip.find(params[:id])
  end

  def create
    @gossip = Gossip.create(user_id: current_user.id, content: params[:gossip][:content], title: params[:gossip][:title])
    redirect_to "/gossips/"
  end

  private
  def gossip_params
    params.require(:gossip).permit(:title, :content)
    end

end