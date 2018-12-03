puts "DNS servers are configured to:"
f = File.open('hosts','r') 
f.each_line do |line|
  if line =~ /^ns[1-2] ansible_host/ 
     puts "- #{line.split('=')[1]}"
  end
end
f.close
