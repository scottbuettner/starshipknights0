require 'appmenustate'
require 'gamediffselectmenustate'

include Gosu
module StarshipKnights

  class GameShipSelectMenuState < AppMenuState
    
    def initialize(app, drawwidth, drawheight)
      @shipoptions = ["Phoenix", "Kitsune", "Centaur", "Wyvern", "Leviathan"]
      @shipoptions << "Thunderbird" if $game.omg["thunderbird"]
      super(app, drawwidth, drawheight, @shipoptions, "Select Ship")
    end
  
    def select_option
      $game.selectship(@shipoptions[@sel_opt].downcase)
      @app.pop_state
      @app.add_state GameDiffSelectMenuState.new(@app, @drawwidth, @drawheight)
    end
  end
  
end