require 'csv'
DEBUG = true


desc "Imports calls from a CSV file"

task :import_calls, [] => :environment do |task,args|
  i = 0

#  Rails.logger.info "======================================================"  
#  Rails.logger.info "Importing calls......"
#  Rails.logger.info "======================================================"  

  path = "db/calls.csv"
  
  CSV.foreach path do |row|
    imported = false
    i += 1
    puts "Processing row #{i}" if DEBUG
  
    src_device = Device.find_by_exten(row[2])
    
    if src_device then
      puts "\tFound outgoing call" if DEBUG   
      outgoing_call = OutgoingCall.new
      outgoing_call.calldate = Time.parse(row[0])
      outgoing_call.clid = row[1]
      outgoing_call.src = src_device.exten
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
        puts "\tError: #{outgoing_call.errors}"
        puts "\tERROR: Failed outgoing call from #{src_device.exten} at row #{i}"
      end
    end  
    
    dst_device = Device.find_by_exten(row[3])
    
    if dst_device then
      puts "\tFound incommig call" if DEBUG   
      incomming_call = IncommingCall.new
      incomming_call.calldate = Time.parse(row[0])
      incomming_call.clid = row[1]
      incomming_call.src = row[2]
      incomming_call.dst = dst_device.exten
      incomming_call.dcontext = row[4]
      incomming_call.channel = row[5]
      incomming_call.dstchannel = row[6]
      incomming_call.lastapp = row[7]
      incomming_call.lastdata = row[8]
      incomming_call.duration = row[9]
      incomming_call.billsec = row[10]
      incomming_call.disposition = row[11]
      incomming_call.amaflags = row[12]
      incomming_call.accountcode = row[13]
      incomming_call.userfield = row[14]
      incomming_call.device_id = dst_device.exten
      if incomming_call.save then
        puts "\tCall saved" if DEBUG
        imported = true
      else
        puts "\tError: #{incomming_call.errors}"
        puts "\tERROR: Failed incomming call from #{dst_device.exten} at row #{i}"
      end
    end  
   
    if !imported then
      puts "\tCall not imported" if DEBUG
      failed_call = FailedCall.new
      failed_call.calldate = Time.parse(row[0])
      failed_call.clid = row[1]
      failed_call.src = row[2]
      failed_call.dst = row[3]
      failed_call.dcontext = row[4]
      failed_call.channel = row[5]
      failed_call.dstchannel = row[6]
      failed_call.lastapp = row[7]
      failed_call.lastdata = row[8]
      failed_call.duration = row[9]
      failed_call.billsec = row[10]
      failed_call.disposition = row[11]
      failed_call.amaflags = row[12]
      failed_call.accountcode = row[13]
      failed_call.userfield = row[14]
   #   failed_call.csv_row = row.join(',')
      failed_call.save
    end
    
  end
end
