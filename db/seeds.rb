# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username: "Test User", email: "testuser@gmail.com", password: "testuser!")
todos = Todo.create([
    {user_id: 1, title: "Clean Dishes", body: "Finish cleaning dishes by 7pm ET", completed: false, completion_time: nil},
    {user_id: 1, title: "Clean Floors", body: "Finish cleaning floors by 7pm ET", completed: false, completion_time: nil},
    {user_id: 1, title: "Clean Curtains", body: "Finish cleaning curtains by 7pm ET", completed: false, completion_time: nil}
])