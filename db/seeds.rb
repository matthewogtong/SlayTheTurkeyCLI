User.destroy_all
Game.destroy_all
Item.destroy_all
Character.destroy_all
#add colums under game class:
# turkey_id
# monster1_id
# monster2_id
# monster3_id
# door1_id
# door2_id
User.create([
    {username: 'antrubbo', password: '123'},
    {username: 'matto', password: '456'}
])

anthony = User.first
matt = User.second


# Association with Games
game1.user = anthony => <User:0x00007facdaa08258 id: 3, username: "antrubbo", password: "123">
anthony.games << game1(shovel method no good)
matt.games.all
# Association with Character through Game

# Association with Item through Game

Game.create([
    {level_count: 0, move_count: 0},
    {level_count: 1, move_count: 1}
])

game1 = Game.first
game2 = Game.second

# Association with User

# Association with Character 
game1.character = thomas => [<Character:0x00007facde8dbbb0 id: 5, name: "Thomas Smith", power: 5, money: 2, hp: 1>]

# Association with Items
game1.items.all

Character.create([
    {name: 'Thomas Smith', power: 5, money: 2, hp: 1},
    {name: 'Elizabeth Holmsworth', power: 3, money: 4, hp: 1},
    {name: 'Yam Destroyer', power: 2, hp: 1},
    {name: "The Turkey", power: 10, hp: 5}
])

thomas = Character.first
elizabeth = Character.second
yammie = Character.third
tom = Character.fourth


# Association with Game

# Association with Users through Game
thomas.users => [<User:0x00007facde92b660 id: 3, username: "antrubbo", password: "123">]

# Association with Items through Game

Item.create([
    {name: "potato", money_up: 3},
    {name: "axe", power_up: 1},
    {name: "bible", wisdom: "This would be the clue to the riddle!"}
])

tater = Item.first
axe = Item.second
bible = Item.third

# Association with Game
tater.game = game1
game1.items.all works, game1.items returns an empty array

bible.game = game2
game2.items.all works, same as above
# Association with Characters through Game

# Association with Users through Game




