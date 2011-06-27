require 'csv'
DEBUG = true

desc "Imports calls from a CSV file"

task :import_calls do |task,args|
  i = 0
  
  path = "db/calls.csv"
  
  CSV.foreach path do |row|
    src_device = Device.find_by_exten(row[2])
    puts src_extension
 
    imported = false
    i += 1
    puts "Processing row #{i}" if DEBUG
    src_device = Device.find_by_exten(row[2])
    
    if src_device then
      puts "\tFound outgoing call" if DEBUG   
      outgoing_call = OutgoingCall.new
      outgoing_call.date = Time.parse(row[0])
      outgoing_call.clid = row[1]
      outgoing_call.src = src_device.id
      outgoing_call.dst = row[3]
      outgoing_call.dcontext = row[4]
      outgoing_call.channel = row[5]
      outgoing_call.dstchannel = row[6]
      outgoing_call.lastapp = row[7]
      outgoing_call.lastdata = row[8]
      outgoing_call.duration = row[9]
      outgoing_call.billsec = row[10]
      outgoing_call.disposition = row[11]
      outgoing_call.amaflags = row[12]
      outgoing_call.accountcode = row[13]
      outgoing_call.userfield = row[14]
      if outgoing_call.save then
        puts "\tCall saved" if DEBUG
        imported = true
      else
        puts "\tERROR: Failed outgoing call from #{src_device.number} at row #{i}"
      end
    end  
    
  end
end
