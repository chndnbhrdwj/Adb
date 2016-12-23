require_relative 'Shell'

class Adb
	include Shell

	# Return the result for command adb devices
	def devices
		execute("adb devices")
	end

	# Install the apk to connected android device
	# Params:
  	# +apk_path+:: Path for the apk file
	def install(apk_path)
		execute("adb install #{apk_path}")		
	end

	# Uninstall the application from connected android device
	# Params:
  	# +apk_package+:: Package of installed application on connected android device
	def uninstall(apk_package)
		execute("adb uninstall #{apk_package}")		
	end

end