#Provide for force10 'VLAN' Type

require 'puppet/provider/dell_ftos'

Puppet::Type.type(:force10_zone).provide :dell_ftos, :parent => Puppet::Provider::Dell_ftos do

  desc "Dell Force10 switch provider for zone configuration."

  mk_resource_methods

  def self.get_current(name)
    transport.switch.zone(name).params_to_hash
  end

  def flush
    transport.switch.zone(name).update(former_properties, properties)
    super
  end
end
