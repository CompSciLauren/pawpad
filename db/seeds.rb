# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AnimalSex.find_or_create_by(id: 1, sex: 'M', sex_description: 'Male')
AnimalSex.find_or_create_by(id: 2, sex: 'F', sex_description: 'Female')
AnimalSex.find_or_create_by(id: 3, sex: 'U', sex_description: 'Unknown')
