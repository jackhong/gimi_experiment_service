require 'gimi/resource'
require 'omf-sfa/resource/oresource'

module GIMI::Resource

  # This class represents a user in the system.
  #
  class Slice < OMF::SFA::Resource::OResource
    oproperty :sliceID, String #URN of slice
    oproperty :created_at, DataMapper::Property::Time
    oproperty :valid_until, DataMapper::Property::Time

    @@def_duration = 100 * 86400 # 100 days

    def self.default_duration=(duration)
      @@def_duration = duration
    end


    # def to_hash_long(h, objs, opts = {})
      # super
      # h[:project] = self.project.to_hash_brief(opts)
      # h
    # end
    def initialize(*args)
      super
      self.created_at = Time.now
      if self.valid_until == nil
        self.valid_until = Time.now + @@def_duration
      end
    end

    def to_hash_brief(opts = {})
      #h = super
      h = {}
      _oprops_to_hash(h, opts)
    end



  end # classs
end # module
