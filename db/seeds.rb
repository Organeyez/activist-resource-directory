Category.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Mental Health & Psychology", "Labor & Economics", "Politics", "History", "Laws & The Constitution", "Schools & Education", "Legal Support", "Fundraising", "Technology", "Medicine", "Environmental Science/Environmental Issues", "Gender", "Sexuality", "Organization Building", "Transportation", "Finance", "Business", "Family & Parenting", "Housing", "Personal Development", "Spirituality" " Religion", "Scholarships", "Miscellaneous", "International Affairs", "Human Trafficking", "Criminal Justice", "Prisons", "Drugs", "Race & Ethnicity"]

categories.each do |category|
	Category.create(title: category)
end