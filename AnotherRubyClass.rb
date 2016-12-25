require_relative 'Adb'

class AnotherRubyClass 
	include Adb

def get_devices
	devices
end

def install_apk(apk_path,device_serial=nil)
	install(apk_path,device_serial)
end

def uninstall_apk(package,device_serial=nil)
	uninstall(package,device_serial)
end

end