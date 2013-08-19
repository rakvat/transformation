class User < ActiveRecord::Base
  has_one :user_step
  has_one :current_step, through: :user_step, source: :step

  has_one :current_state, class_name: State

  def setup_game
    unless self.current_step
      self.current_step = Step.find_by_sql(['SELECT * FROM steps WHERE code = ? ', Step::START_STEP]).first
      self.current_step.save!
    end
    unless self.current_state
      dup = self.current_step.start_state.dup
      dup.step_start_id = nil
      dup.save!
      self.current_state = dup
    end
  end

  def restart
    self.user_step.delete
    self.current_state.delete
    self.reload
    setup_game
  end

  def check_failure
    if self.current_state.time <= 0
      return {failure: 'Es bleibt keine Zeit mehr zur Transformation.'}
    end
    if self.current_state.happy <= 0
      return {failure: 'Du hast keine Freude mehr am Leben.'}
    end
    if self.current_state.transformers <= 0
      return {failure: 'Kein Mensch will mehr mitmachen bei der Transformation.'}
    end
    if self.current_state.build < 0
      return {failure: 'Du hast Ressourcen genutzt, die nicht für dich zur Verfügung standen, musst aus der Umgebung flüchten und von neuem beginnen.'}
    end
    if self.current_state.establ < 0
      return {failure: 'Du hast bei dem Versuch anarchistische Verhaltensmuster zu etablieren versagt und eher herrschaftförmige Muster reproduziert.'}
    end
    if self.current_state.spread < 0
      return {failure: 'Du es nicht geschafft die Idee des Anarchismus anderen Menschen sympathisch zu vermitteln. Sie haben es eher als Propaganda wahrgenommen oder Angst vor deinen Ideen bekommen und wenden sich von einer herrschaftsfreien Transformation ab.'}
    end
    return {success: true}
  end

  def check_goal
    self.current_state >= self.current_step.goal_state
  end

  def go_to_next_step
    # TODO: store next step in db
    false
  end
end
