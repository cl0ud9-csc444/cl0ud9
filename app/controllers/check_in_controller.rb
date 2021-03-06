class CheckInController < ApplicationController
  def index 
  end

  #show all the player's on our database
  def list
    @tplayers = Person.all
    @pass_str = 'Pass this str'
  end

  def show
  	puts "Check In Controller..."
    
    @tourPlayers = Player.where(tournament_id:params[:id])
    puts "Players in this tournament: #{@tourPlayers.length}"
    #an_id = @tourPlayers[0].person_id;
    #@specificPlayer = Person.where(person_id:an_id)
    #puts "Players who can sign up: #{@tourPlayers.length} & #{@tourPlayers[0].person.profilePicLink}"
    @avatar_img = 'http://www.w3schools.com/w3css/img_avatar6.png'
  end


  def submit
    params[:player_ids].each do |player_id|
      puts "you submitted this form for player id: #{player_id}"
      @aplayer = Player.find(player_id)
      puts "player -> #{@aplayer.person.email}"
      @aplayer.checkedIn = true;

      if @aplayer.save 
        puts "Saved!"
      else
        puts "Error: cant save this player"
      end
    end
  end
end
