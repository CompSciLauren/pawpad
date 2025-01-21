# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AnimalRelationship.find_or_create_by(id: 1, relationship: 'Mother')
AnimalRelationship.find_or_create_by(id: 2, relationship: 'Father')
AnimalRelationship.find_or_create_by(id: 3, relationship: 'Child')
AnimalRelationship.find_or_create_by(id: 4, relationship: 'Sibling')
AnimalRelationship.find_or_create_by(id: 5, relationship: 'Friend')
AnimalRelationship.find_or_create_by(id: 6, relationship: 'Nemesis')

AnimalSex.find_or_create_by(id: 1, sex: 'M', sex_description: 'Male')
AnimalSex.find_or_create_by(id: 2, sex: 'F', sex_description: 'Female')
AnimalSex.find_or_create_by(id: 3, sex: 'U', sex_description: 'Unknown')

CatBreed.find_or_create_by(id: 1, breed: 'Domestic Shorthair')
CatBreed.find_or_create_by(id: 2, breed: 'Domestic Mediumhair')
CatBreed.find_or_create_by(id: 3, breed: 'Domestic Longhair')
CatBreed.find_or_create_by(id: 4, breed: 'Maine Coon')
CatBreed.find_or_create_by(id: 5, breed: 'Siamese')
CatBreed.find_or_create_by(id: 6, breed: 'Russian Blue')
CatBreed.find_or_create_by(id: 7, breed: 'Manx')

CatColor.find_or_create_by(id: 1, color: 'Black')
CatColor.find_or_create_by(id: 2, color: 'White')
CatColor.find_or_create_by(id: 3, color: 'Gray')
CatColor.find_or_create_by(id: 4, color: 'Orange')
CatColor.find_or_create_by(id: 5, color: 'Cream')
CatColor.find_or_create_by(id: 6, color: 'Brown')
CatColor.find_or_create_by(id: 7, color: 'Light Brown')
CatColor.find_or_create_by(id: 8, color: 'Calico (white, orange, black)')
CatColor.find_or_create_by(id: 9, color: 'Tabby')
CatColor.find_or_create_by(id: 10, color: 'Tortoiseshell (black, orange)')
