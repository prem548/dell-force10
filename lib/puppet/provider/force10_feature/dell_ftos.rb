#Provide for force10 'VLAN' Type

require 'puppet/provider/dell_ftos'

Puppet::Type.type(:force10_feature).provide :dell_ftos, :parent => Puppet::Provider::Dell_ftos do

  desc "This represents Dell Force10 switch add-on features that needs to enabled/disabled."

  mk_resource_methods

  def self.get_current(name)
    transport.switch.feature(name).params_to_hash
  end

  def flush
    transport.switch.feature(name).update(former_properties, properties)
    super
  end
  
  
end
