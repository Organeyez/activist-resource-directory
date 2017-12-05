Category.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Mental Health & Psychology", "Climate Change", "Self-Defense", "Labor & Economics", "Politics", "History", "Laws & The Constitution", "Schools & Education", "Legal Support", "Fundraising", "Technology", "Medicine", "Environmental Science & Issues", "Gender", "Sexuality", "Organization Building", "Transportation", "Finance", "Business", "Family & Parenting", "Housing", "Personal Development", "Spirituality", "Religion", "Scholarships", "Miscellaneous", "International Affairs", "Trafficking", "Criminal Justice", "Prisons", "War on Drugs", "Race & Ethnicity", "Global Poverty", "Health Care", "Child Labor", "Economic Justice", "U.S. Poverty", "HIV/AIDS", "Immigration", "Conflicts in the Middle East", "U.S. Military Activities & Spending", "Debt", "Water", "Food Justice", "Civil Rights & Discrimination", "Government Spending", "Humanitarian Crises", "Slavery", "Constructive Engagement of Conflict" ]

categories.each do |category|
	Category.create(title: category)
end

user = User.create(username: "cosmosiris", email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_LOGIN_PASSWORD'], admin: true)

