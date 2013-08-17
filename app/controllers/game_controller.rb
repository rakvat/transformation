class GameController < ApplicationController

  # GET /game
  def login
    @users = User.all
  end

  # GET /game/:user
  def play
    @user = User.find(params[:user])
    @user.setup_game
    @moves = Move.all.sample(5)
  end

  # PUT 'game/:user/move/:move'
  def move 
    @user = User.find(params[:user])
    move = Move.find(params[:move])
    respond_to do |format|
      format.html { redirect_to game_play_path(@user), notice: 'Ok. Dein Status wurde aktualisiert. Weiter, und nicht vergessen, ...' }
      format.json { head :no_content }
    end
  end
end
