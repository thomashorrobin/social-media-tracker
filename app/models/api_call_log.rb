class ApiCallLog < ActiveRecord::Base
  def self.write_to_api_call_log (message, successful, path, id, handle, records_inserted)
      
      @api_call_log = ApiCallLog.new
      
      @api_call_log.call_date_time = Time.new
      @api_call_log.call_description = message
      @api_call_log.successful = successful
      @api_call_log.end_point_path = path
      @api_call_log.human_readable_id = id
      @api_call_log.static_id = handle
      @api_call_log.records_inserted = records_inserted
      
      @api_call_log.save
      
    end
end
