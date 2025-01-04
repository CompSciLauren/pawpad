class FosterCatsController < ActionController::Base
    def index
        records = FosterCat.all
        puts "LAUREN: #{records.first}"
        render json: {
            hi: 'there'
        }
    rescue StandardError => e
        puts "ERROR: #{e}"
    end
end
