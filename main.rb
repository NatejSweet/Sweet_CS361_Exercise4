# Exercise 5 Part 1 (Exception Handling)

class MentalState
    def auditable?
        if self.externalService
            return true
        else 
            return false
      # true if the external service is online, otherwise false
    end
    def audit!
        if !self.auditable?:
            raise 'ExternalServiceOfflineException'
           
      # Could fail if external service is offline
    end
    def do_work
      # Amazing stuff...
    end
  end
  
  def audit_sanity(bedtime_mental_state)
    return 0 unless bedtime_mental_state.auditable?
    if bedtime_mental_state.audit!.ok?
      MorningMentalState.new(:ok)
    else 
      MorningMentalState.new(:not_ok)
    end
  end
  
  if audit_sanity(bedtime_mental_state) == 0
    puts "error"
  else
    new_state = audit_sanity(bedtime_mental_state)
  end
  
  
  
  
  
  # Exercise 5 Part 2 (Don't Return Null / Null Object Pattern)
  
  class BedtimeMentalState < MentalState ; end
  
  class MorningMentalState < MentalState ; end
  
  def audit_sanity(bedtime_mental_state)
    return :not_auditable unless bedtime_mental_state.auditable?
    if bedtime_mental_state.audit!.ok?
      MorningMentalState.new(:ok)
    else 
      MorningMentalState.new(:not_ok)
    end
  end
  
  new_state = audit_sanity(bedtime_mental_state)
  new_state.do_work
  
  
  
  
  # Exercise 5 Part 3 (Wrapping APIs)
  
  require 'candy_service'
  
  machine = CandyMachine.new
  prepare(machine)
  

  if ready?(machine)
   make!(machine)
  else
    puts "sadness"
  end

  def prepare(machine)
    return machine.prepare
def ready?(machine)
    return machine.ready?
def make!(machine)
    return machine.make!


  