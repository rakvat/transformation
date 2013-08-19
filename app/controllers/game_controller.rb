class GameController < ApplicationController
  before_action :set_user, except: [:login]

  # GET /game
  def login
    @messages = {}
    @messages['welcome'] = "Willkommen zur 'Transformation'!"
    @messages['intro'] = "Du hast kein Bock mehr auf die Ungerechtigkeiten und Unsinnigkeiten, auf die Diskriminierung und Herrschaftsverhältnisse in der jetzigen Gesellschaft. Du beschließt mitzumachen, bei der Transformation in eine möglichst herrschaftsfreie Gesellschaft, die die Grenzen überwinden und mindestens drei Generationen andauern soll."
    @users = User.all
  end

  # GET /game/:user
  def play
    @user.setup_game
    @moves = Move.all.sample(3)
  end
  
  # PUT /game/:user/restart
  def restart
    @user.restart
    respond_to do |format|
      format.html { redirect_to game_play_path(@user) }
      format.json { head :no_content }
    end
  end

  # PUT /game/:user/move/:move
  def move 
    move = Move.find(params[:move])
    @user.current_state.update(move)
    @user.reload
    respond_to do |format|
      check_failure_response = @user.check_failure
      if check_failure_response.include?(:failure)
        flash.now[:notice] = [check_failure_response[:failure],
          'Das Spiel ist beendet, bis zur nächsten Transformation.']
        format.html { render 'game/over' }
        format.json { head :no_content }
      elsif @user.check_goal
        if (@user.go_to_next_step)
          format.html { redirect_to game_play_path(@user), notice: 'Yey, du hast das Ziel der Stufe erreicht und kannst dir nun das Ziel der nächsten Stufe zur Transformation vornehmen.' }
          format.json { head :no_content }
        else
          format.html { redirect_to game_play_path(@user), notice: 'Yey, du hast das Ziel der Stufe erreicht und kannst dir nun das Ziel der nächsten Stufe zur Transformation vornehmen. Es sind keine weiteren Schritte zur Transformation in diese Software eingepflegt. Was willst du tun? Deinen eigenen Weg gehen?' }
          format.json { head :no_content }
        end
      else
        format.html { redirect_to game_play_path(@user), notice: 'Ok. Dein Status wurde aktualisiert. Weiter, und nicht vergessen, ...' }
        format.json { head :no_content }
      end
    end
  end


  private

    def set_user
      @user = User.find(params[:user])
    end
end
