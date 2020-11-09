User.destroy_all
Game.destroy_all
Item.destroy_all
Character.destroy_all

User.create([
    {username: 'antrubbo', password: '123'},
    {username: 'matto', password: '456'}
])

# u1 = User.first

Game.create([
    {level_count: 0, move_count: 0},
    {level_count: 1, move_count: 1}
)]


Character.create([
    {name: 'Thomas Smith', power: 5, money: 2, hp: 1},
    {name: 'Elizabeth Holmsworth', power: 3, money: 4, hp:},
    {name: 'Yam Destroyer', power:2, hp: 1},
    {name: "The Turkey", power: 10, hp: 5}
])

Item.create([
    {name: "potato", money_up: 3},
    {name: "axe", power_up: 1},
    {name: "some book", wisdom: "This would be the clue to the riddle!"}
])


