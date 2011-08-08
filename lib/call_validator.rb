class CallValidator < ActiveModel::Validator

  # this is to deny upload two calls made in the same time
  def validate(record)
    record.errors[:base] << "Record already loaded" unless check(record)
  end

  private

    def check(record)
      calls = record.class.by_date(record.calldate)
      calls.select{|c| c.src == record.src && c.dst == record.dst}.empty?
    end
end



