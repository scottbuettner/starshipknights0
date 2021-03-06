require 'shot'

module StarshipKnights
  module Entities
    class EnemyTwinLaserShot < StarshipKnights::EntityTypes::Shot
      class << self
        attr_accessor :shootingproperties, :firesound
      end
      @shootingproperties = {:cooldown => 0.55}
      @firesound = "pew"
      
      def configure(opts)
        opts["radius"] ||= 5.0
        opts["imagename"] ||= "enemytwinlasershot"
        opts["lifetimer"] ||= 0.75
        opts["hits"] ||= 1
        opts["damage"] ||= 1.75 + $game.difficulty * 0.10
        opts["speed"] ||= 425.0
        opts["inheritance"] ||= 0.15
        
        super(opts)
      end
      
      def to_s
        return "EnemyTwinLaserShot " + super
      end
      
    end
  end
end