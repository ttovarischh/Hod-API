# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Effect.destroy_all
User.destroy_all
Game.destroy_all
Player.destroy_all
Monster.destroy_all
puts "Destroyed everything you touch"

effects = [
    { 
        name: 'Ослепленный',
        descr: 'Ослеплённое существо ничего не видит и автоматически проваливает все проверки характеристик, связанные со зрением. Броски атаки по такому существу совершаются с преимуществом, а его броски атаки совершаются с помехой.',
    }, 
    { 
        name: 'Окаменевший',
        descr: 'Ослеплённое существо ничего не видит и автоматически проваливает все проверки характеристик, связанные со зрением. Броски атаки по такому существу совершаются с преимуществом, а его броски атаки совершаются с помехой.',
    }, 
    { 
        name: 'Оглохший',
        descr: 'Оглохшее существо ничего не слышит и автоматически проваливает все проверки характеристик, связанные со слухом.',
    }, 
    { 
        name: 'Невидимый',
        descr: 'Невидимое существо невозможно увидеть без помощи магии или особого чувства. С точки зрения скрытности существо считается сильно заслонённым. Местонахождение существа можно определить по шуму, который оно издаёт, или по оставленным им следам. Броски атаки по невидимому существу совершаются с помехой, а его броски атаки — с преимуществом.',
    }, 
    { 
        name: 'Схваченный',
        descr: 'Скорость схваченного существа равна 0, и оно не получает выгоды ни от каких бонусов к скорости. Состояние оканчивается, если схвативший становится недееспособным. Это состояние также оканчивается, если какой-либо эффект выводит схваченное существо из зоны досягаемости того, кто его удерживает, или из зоны удерживающего эффекта. Например, когда существо отбрасывается заклинанием волна грома [thunderwave].',
    }, 
    { 
        name: 'Испуганный',
        descr: 'Испуганное существо совершает с помехой проверки характеристик и броски атаки, пока источник его страха находится в пределах его линии обзора. Существо не способно добровольно приблизиться к источнику своего страха.',
    }, 
    { 
        name: 'Опутанный',
        descr: 'Скорость опутанного существа равна 0, и оно не получает выгоды ни от каких бонусов к скорости. Броски атаки по такому существу совершаются с преимуществом, а его броски атаки — с помехой. Существо совершает с помехой спасброски Ловкости.',
    }, 
    { 
        name: 'Отравленный',
        descr: 'Отравленное существо совершает с помехой броски атаки и проверки характеристик.',
    },
    { 
        name: 'Очарованный',
        descr: 'Находящееся без сознания существо недееспособно, не способно перемещаться и говорить, а также не осознаёт своё окружение. Существо роняет всё, что держит, и падает ничком. Существо автоматически проваливает спасброски Силы и Ловкости. Броски атаки по существу совершаются с преимуществом. Любая атака, попавшая по такому существу, считается критическим попаданием, если нападающий находится в пределах 5 футов от него.',
    },
    { 
        name: 'Бессознательный',
        descr: 'Очарованное существо не может атаковать того, кто его очаровал, а также делать его целью умения или магического эффекта, причиняющего вред. Искуситель совершает с преимуществом все проверки характеристик при социальном взаимодействии с очарованным существом.',
    }, 
]

users = [
    { 
        email: 'polinasot@gmail.com',
        password: 'polinka6677',
        password_confirmation: 'polinka6677',
        username: 'ttovarishh',
    }, 
    { 
        email: 'kauzt@mail.ru',
        password: 'topsecret',
        password_confirmation: 'topsecret',
        username: 'kauzt',
    }, 
    { 
        email: 'nadyuha@yandex.ru',
        password: 'coolgirl',
        password_confirmation: 'coolgirl',
        username: 'nadyakit',
    }, 
    { 
        email: 'vadim@yahoo.com',
        password: 'genius',
        password_confirmation: 'genius',
        username: 'm1d45',
    }, 
    { 
        email: 'tesspot@yandex.ru',
        password: 'mmm1010',
        password_confirmation: 'mmm1010',
        username: 'tesspot',
    }, 
    { 
        email: 'krutaya@edu.hse.ru',
        password: 'loveher',
        password_confirmation: 'loveher',
        username: 'abarabonova',
    }, 
    { 
        email: 'master@yandex.ru',
        password: 'master',
        password_confirmation: 'master',
        username: 'master',
    }, 
    { 
        email: 'dead@edu.hse.ru',
        password: 'killmeh',
        password_confirmation: 'killmeh',
        username: 'killmeh',
    }, 
    { 
        email: 'good@mail.ru',
        password: 'rubyonrails',
        password_confirmation: 'rubyonrails',
        username: 'atarax',
    }, 
]

games = [
    {
      code: 'HB236',
      name: 'Friday night',
      user_id: 1,
    },
    {
        code: 'KL378',
        name: 'After work',
        user_id: 2,
    },
    {
        code: 'OP480',
        name: '$uper fun',
        user_id: 3,
    },
    {
        code: 'AP113',
        name: 'Newbies',
        user_id: 4,
    },
    {
        code: 'RK437',
        name: 'For fun',
        user_id: 5,
    },
    {
        code: 'DF128',
        name: 'Hold my beer',
        user_id: 1,
    }
]

players = [
    {
      name: 'Гоблин Боблин',
      game_id: 1,
      hp: 2,
      language: 'русский, гоблинский, украинский',
      perc: 12,
      inv: 11,
      ins: 10,
      armor: 24,
      conc: 10,
    },
    {
        name: 'Эльф',
        game_id: 1,
        hp: 5,
        language: 'подземный эльфоовый',
        perc: 5,
        inv: 8,
        ins: 10,
        armor: 23,
        conc: 13,
    },
    {
        name: 'Иуда Искариот',
        game_id: 1,
        hp: 20,
        language: 'иврит, целовательный, дотракийский',
        perc: 11,
        inv: 12,
        ins: 13,
        armor: 25,
        conc: 17,
    },
    {
        name: 'Крот',
        game_id: 1,
        hp: 4,
        language: 'кротиный, английский, эльфийский',
        perc: 13,
        inv: 14,
        ins: 3,
        armor: 5,
        conc: 22,
    },
    {
        name: 'Фея А',
        game_id: 2,
        hp: 2,
        language: 'русский, гоблинский, украинский',
        perc: 12,
        inv: 11,
        ins: 10,
        armor: 24,
        conc: 10,
      },
      {
          name: 'Фея Б',
          game_id: 2,
          hp: 5,
          language: 'подземный эльфоовый',
          perc: 5,
          inv: 8,
          ins: 10,
          armor: 23,
          conc: 13,
      },
      {
          name: 'Фея Д',
          game_id: 3,
          hp: 20,
          language: 'иврит, целовательный, дотракийский',
          perc: 11,
          inv: 12,
          ins: 13,
          armor: 25,
          conc: 17,
      },
      {
          name: 'Фея Г',
          game_id: 3,
          hp: 4,
          language: 'кротиный, английский, эльфийский',
          perc: 13,
          inv: 14,
          ins: 3,
          armor: 5,
          conc: 22,
    },
    {
      name: 'Гоблин Боблин',
      game_id: 3,
      hp: 2,
      language: 'русский, гоблинский, украинский',
      perc: 12,
      inv: 11,
      ins: 10,
      armor: 24,
      conc: 10,
    },
    {
        name: 'Эльф',
        game_id: 3,
        hp: 5,
        language: 'подземный эльфоовый',
        perc: 5,
        inv: 8,
        ins: 10,
        armor: 23,
        conc: 13,
    },
    {
        name: 'Иуда Искариот',
        game_id: 3,
        hp: 20,
        language: 'иврит, целовательный, дотракийский',
        perc: 11,
        inv: 12,
        ins: 13,
        armor: 25,
        conc: 17,
    },
    {
        name: 'Крот',
        game_id: 3,
        hp: 4,
        language: 'кротиный, английский, эльфийский',
        perc: 13,
        inv: 14,
        ins: 3,
        armor: 5,
        conc: 22,
    },
]

monsters = [
    {
      name: 'Орк',
      game_id: 1,
      hp: 28,
    },
    {
        name: 'Демон',
        game_id: 1,
        hp: 5,
    },
    {
        name: 'Крыса',
        game_id: 1,
        hp: 20,
    },
    {
        name: 'Нечисть',
        game_id: 1,
        hp: 4,
    },
    {
        name: 'Орк',
        game_id: 2,
        hp: 28,
      },
      {
          name: 'Демон',
          game_id: 2,
          hp: 5,
      },
      {
          name: 'Крыса',
          game_id: 2,
          hp: 20,
      },
      {
          name: 'Нечисть',
          game_id: 2,
          hp: 4,
      },
]



users.each do |user|
    userarray = User.create(user)
    puts "Some MAGIC just created a #{ userarray.id } with name #{ userarray.email }!"
end

# effects.each do |effect|
#     effectarray = Effect.create(effect)
#     puts "Some MAGIC just created a #{ effectarray.id } with name #{ effectarray.name }!"
# end

# games.each do |game|
#     gamearray = Game.create(game)
#     puts "Some MAGIC just created a #{ gamearray.id } with name #{ gamearray.name }!"
# end

# players.each do |player|
#     playerarray = Player.create(player)
#     puts "Some MAGIC just created a #{ playerarray.id } with name #{ playerarray.name }!"
# end

# monsters.each do |monster|
#     monsterarray = Monster.create(monster)
#     puts "Some MAGIC just created a #{ monsterarray.id } with name #{ monsterarray.name }!"
# end


