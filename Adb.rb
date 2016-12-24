require 'open3'

module Adb
	
# Runs a subprocess, returns the output and raises the exception if error occurs
def execute(command)
	stdout, stderr, status = Open3.capture3("adb "+command)
	if !stderr.empty?
		raise "#{command} failed with message \n #{stderr}" 
	end
	return stdout
end

# Return the array of connected android devices
def devices
	execute("devices").split("\n")[1..-1]
end

# Install the apk to connected android device
# Params:
# +apk_path+:: Path for the apk file
def install(apk_path, serial=nil)
	command= (serial.nil?) ? "install #{apk_path}" : "-s #{serial} install #{apk_path}"
	execute(command)		
end

# Uninstall the application from connected android device
# Params:
# +apk_package+:: Package of installed application on connected android device
def uninstall(apk_package,serial=nil)
	command= (serial.nil?) ? "uninstall #{apk_package}": "-s #{serial} uninstall #{apk_package}"
	execute(command)		
end

end