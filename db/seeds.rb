Category.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Psychology", "Economics", "Politics", "History", "Laws & The Constitution", "Education", "Legal Support", "Fundraising", "Technology", "Medicine", "Environmental Studies", "Gender", "Sexuality", "Organization Building", "Transportation", "Finance", "Business", "Family & Parenting", "Housing", "Personal Development", "Spirituality & Religion", "Scholarships", "Miscellaneous"]

categories.each do |category|
	Category.create(title: category)
end