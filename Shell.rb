require 'open3'

module Shell

# Runs a subprocess, returns the output and raises the exception if error occurs
def execute(command)
	stdout, stderr, status = Open3.capture3(command)
	if !stderr.empty?
		raise "#{command} failed with message \n #{stderr}" 
	end
	return stdout
end

end
