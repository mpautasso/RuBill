class CallValidator < ActiveModel::Validator


  def validate(record)
    record.errors[:base] << "Record already loaded" unless check(record)
  end

  private

    def check(record)
      calls = OutgoingCall.by_date(record.calldate)
      !calls.select{|c| c.src == record.src && c.dst == record.dst}
    end
end



