require 'gliderenemy'
require 'slider'

module StarshipKnights
  module Entities
    class RoundBlockEnemy < StarshipKnights::EntityTypes::GliderEnemy
      include StarshipKnights::Components::Slider
      
      def self.colorvalues
        return {"cyan"=> 15, "yellow"=> 15, "fuschia"=> 15}
      end
      
      def configure(opts)
        @color = opts["color"] || "gray"
        opts["imagename"] ||= "rndblockenemy"+@color
        case @color
          when "yellow"
            opts["priweptypename"] ||= "enemyrailshot"
          when "fuschia"
            opts["priweptypename"] ||= "enemytriangleshot"
          when "cyan"
            opts["priweptypename"] ||= "enemytwinlasershot"
        end
        opts["scorevalue"] ||= self.class.colorvalues[@color]
        #opts["weaponcdtimer"] ||= 0.35
        #@altshottype = "spreadshot"
        opts["turnspeed"] ||= 225.0
        #opts["maxspeed"] ||= 225.0
        opts["forwardspeed"] ||= 200 #opts["maxspeed"] * 2.0/3.0
        opts["slidespeed"] ||= 150 #opts["maxspeed"] * 1.0/3.0
        opts["reversespeed"] ||= 120 #opts["maxspeed"] * 1.0/2.0
        #@next_cd = 0.14
        #@next_alt_cd = 0.75
        opts["maxhealth"] = 4.0 + $game.difficulty * 1.15
        opts["damage"] = 3.0 + $game.difficulty * 0.85
        super(opts)
      end
      
      def physics(dt, inputs)
        clear_vel
        
        #$logger.debug {"#{inspect} #{inputs}" }
        @sliding = false
        #look for slide
        inputs.each do |input|
          case input.cmd
            when "special"
              @sliding = true
          end
        end
        super(dt, inputs)
      end
      
      def to_s
        return "RoundBlockEnemy " + super
      end
      
    end
  end
end
