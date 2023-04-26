Effect.destroy_all
User.destroy_all
Game.destroy_all
Player.destroy_all
Monster.destroy_all
puts "Destroyed everything you touch"

effects = [
    { 
        name: 'Без сознания',
        descr: 'Находящееся без сознания существо «недееспособно», не способно перемещаться и говорить, а также не осознаёт своё окружение. Существо роняет всё, что держит, и падает ничком. Броски атаки по существу совершаются с преимуществом. Любая атака, попавшая по такому существу, считается критическим попаданием, если нападающий находится в пределах 5 футов от него. Существо автоматически проваливает спасброски Силы и Ловкости',
        image: 'UnconsciousIcon'
    }, 
    { 
        name: 'Испуг',
        descr: 'Испуганное существо совершает с  помехой проверки характеристик и  броски атаки, пока источник его страха находится в  пределах его линии обзора. Существо не  способно добровольно приблизиться к  источнику своего страха',
        image: 'FrightenedIcon'
    }, 
    { 
        name: 'Истощение',
        descr: 'Некоторые особые способности и  опасности окружающей среды, такие как недоедание и  длительное воздействие очень низких или высоких температур, могут стать причиной состояния, называемого истощением. Истощение делится на  шесть степеней. Эффект даёт существу ту  или иную степень истощения, согласно описанию. Если существо, уже находящееся в  состоянии истощения, подвергается воздействию другого эффекта, вызывающего истощение, его текущая степень истощения повышается на  значение, указанное в  описании эффекта. На  существо воздействуют эффекты не  только текущей степени истощения, но  и  более слабых степеней. Например, существо на  2  степени истощения перемещается в  два раза медленнее и  совершает с  помехой проверки характеристик. Эффект, снимающий истощение, понижает его степень согласно описанию эффекта, вплоть до  окончания действия истощения, если степень истощения существа становится ниже 1. Продолжительный отдых снижает степень истощения на  1, при условии, что существо что-нибудь съест и  выпьет. Кроме того, воскрешение из  мёртвых снижает уровень истощения существа на  1',
        image: 'ExhaustionIcon'
    }, 
    { 
        name: 'Невидимость',
        descr: 'Невидимое существо невозможно увидеть без помощи магии или особого чувства. С  точки зрения скрытности существо считается сильно заслонённым. Местонахождение существа можно определить по  шуму, который оно издаёт, или по  оставленным им  следам. Броски атаки по  невидимому существу совершаются с  помехой, а  его броски атаки  &mdash; с  преимуществом',
        image: 'InvisibleIcon'
    }, 
    { 
        name: 'Недееспособность',
        descr: 'Недееспособное существо не  может совершать действия и  реакции. Недееспособные существа автоматически проваливают проверки для сопротивления захвату или толчку. Существо теряет концентрацию на  заклинании, если становится недееспособным',
        image: 'IncapacitatedIcon'
    }, 
    { 
        name: 'Оглушение',
        descr: 'Оглохшее существо ничего не  слышит и  автоматически проваливает все проверки характеристик, связанные со  слухом',
        image: 'DeafenedIcon'
    }, 
    { 
        name: 'Окаменение',
        descr: 'Окаменевшее существо, а  также все немагические предметы, которые оно несёт или носит, трансформируется в  твёрдое инертное вещество (как правило, в  камень). Его вес увеличивается в  10  раз, и  оно перестаёт стареть. Существо недееспособно, не  способно двигаться и  говорить, а  также не  осознаёт своё окружение. Броски атаки по  существу совершаются с  преимуществом. Существо автоматически проваливает спасброски Силы и  Ловкости. Существо получает сопротивление ко  всем видам урона. Существо получает иммунитет к  ядам и  болезням. Если яд  или болезнь уже действовали на  существо, их  действие приостанавливается, но  не  исчезает',
        image: 'PetrifiedIcon'
    }, 
    { 
        name: 'Опутанноость',
        descr: 'Скорость опутанного существа равна  0, и  оно не  получает выгоды ни  от  каких бонусов к  скорости. Броски атаки по  такому существу совершаются с  преимуществом, а  его броски атаки  &mdash; с  помехой. Существо совершает с  помехой спасброски Ловкости',
        image: 'RestrainedIcon'
    },
    { 
        name: 'Ослепление',
        descr: 'Ослеплённое существо ничего не  видит и  автоматически проваливает все проверки характеристик, связанные со  зрением. Броски атаки по  такому существу совершаются с  преимуществом, а  его броски атаки совершаются с  помехой',
        image: 'BlindedIcon'
    },
    { 
        name: 'Отравление',
        descr: 'Отравленное существо совершает с  помехой броски атаки и  проверки характеристик',
        image: 'PoisonedIcon'
    }, 
    { 
        name: 'Очарованность',
        descr: 'Очарованное существо не  может атаковать того, кто его очаровал, а  также делать его целью умения или магического эффекта, причиняющего вред. Искуситель совершает с  преимуществом все проверки характеристик при социальном взаимодействии с  очарованным существом',
        image: 'CharmedIcon'
    }, 
    { 
        name: 'Ошеломление',
        descr: 'Ошеломлённое существо недееспособно, не  способно перемещаться и  говорит, запинаясь. Существо автоматически проваливает спасброски Силы и  Ловкости. Броски атаки по  существу совершаются с  преимуществом',
        image: 'StunnedIcon'
    }, 
    { 
        name: 'Паралич',
        descr: 'Парализованное существо недееспособно и  не  способно перемещаться и  говорить. Существо автоматически проваливает спасброски Силы и  Ловкости. Броски атаки по  парализованному существу совершаются с преимуществом. Любая атака, попавшая по  такому существу, считается критическим попаданием, если нападающий находится в  пределах 5  футов от  существа',
        image: 'ParalyzedIcon'
    }, 
    { 
        name: 'Сбитый с ног',
        descr: 'Сбитое с ног существо способно перемещаться только ползком, пока не встанет, прервав тем самым это состояние. Существо совершает с  помехой броски атаки. Броски атаки по  существу совершаются с  преимуществом, если нападающий находится в  пределах 5  футов от  него. В  противном случае броски атаки совершаются с  помехой',
        image: 'star'
    }, 
    { 
        name: 'Схваченность',
        descr: 'Скорость схваченного существа равна  0, и  оно не  получает выгоды ни  от  каких бонусов к  скорости. Состояние оканчивается, если схвативший становится недееспособным. Это состояние также оканчивается, если какой-либо эффект выводит схваченное существо из  зоны досягаемости того, кто его удерживает, или из  зоны удерживающего эффекта. Например, когда существо отбрасывается заклинанием волна грома [thunderwave]',
        image: 'GrappledIcon'
    }, 
]

users = [
    { 
        email: 'polinasot@gmail.com',
        password: 'polinka6677',
        password_confirmation: 'polinka6677',
        username: 'ttovarishh',
        about: "Начала играть благодаря друзьям и теперь тоже пьет пиво...",
    }, 
    { 
        email: 'kauzt@mail.ru',
        password: 'topsecret',
        password_confirmation: 'topsecret',
        username: 'kauzt',
        about: "А мы не должны бросить силу воли на сопротивление безумию или типа того",
    }, 
    { 
        email: 'nadyuha@yandex.ru',
        password: 'coolgirl',
        password_confirmation: 'coolgirl',
        username: 'nadyakit',
        about: "Вывод: не давайте идиотам выпивку без нужды.",
    }, 
    { 
        email: 'vadim@yahoo.com',
        password: 'genius',
        password_confirmation: 'genius',
        username: 'm1d45',
        about: "Он не подозревал, что есть участь хуже смерти",
    }, 
    { 
        email: 'tesspot@yandex.ru',
        password: 'mmm1010',
        password_confirmation: 'mmm1010',
        username: 'tesspot',
        about: "Если наша партия наполовину состоит из полуэльфов, можно ли считать, что она на четверть состоит из эльфов?",
    }, 
    { 
        email: 'krutaya@edu.hse.ru',
        password: 'loveher',
        password_confirmation: 'loveher',
        username: 'abarabonova',
        about: "Поединок 1:0 мне нравится гораздо больше!",
    }, 
    { 
        email: 'master@yandex.ru',
        password: 'master',
        password_confirmation: 'master',
        username: 'master',
        about: "Предлагаю переименовать Дайна в 'Мастера дипломатии'",
    }, 
    { 
        email: 'dead@edu.hse.ru',
        password: 'killmeh',
        password_confirmation: 'killmeh',
        username: 'killmeh',
        about: "Сейчас я игроков убью и освобожусь"
    }, 
    { 
        email: 'good@mail.ru',
        password: 'rubyonrails',
        password_confirmation: 'rubyonrails',
        username: 'atarax',
        about: "Вы идёте по дороге и видите лес, высоко уходящий в ширину",
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
        name: 'Super fun',
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
        language: 'русский гоблинский украинский',
        perc: 12,
        inv: 11,
        ins: 10,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/img.png"
    },
    {
        name: 'Эльф',
        game_id: 1,
        language: 'подземный эльфоовый',
        perc: 5,
        inv: 8,
        ins: 10,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/1hod.png"
    },
    {
        name: 'Иуда Искариот',
        game_id: 1,
        language: 'иврит целовательный дотракийский',
        perc: 11,
        inv: 12,
        ins: 13,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/2hod.png"
    },
    {
        name: 'Крот',
        game_id: 1,
        language: 'кротиный английский эльфийский',
        perc: 13,
        inv: 14,
        ins: 3,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/3hod.png"
    },
    {
        name: 'Фея А',
        game_id: 2,
        language: 'русский гоблинский украинский',
        perc: 12,
        inv: 11,
        ins: 10,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/4hod.png"
      },
      {
        name: 'Фея Б',
        game_id: 2,
        language: 'подземный эльфоовый',
        perc: 5,
        inv: 8,
        ins: 10,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/3hod.png"
      },
      {
        name: 'Фея Д',
        game_id: 3,
        language: 'иврит целовательный дотракийский',
        perc: 11,
        inv: 12,
        ins: 13,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/2hod.png"
      },
      {
        name: 'Фея Г',
        game_id: 3,
        language: 'кротиный английский эльфийский',
        perc: 13,
        inv: 14,
        ins: 3,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/2hod.png"
    },
    {
        name: 'Гоблин Боблин',
        game_id: 3,
        language: 'русский гоблинский украинский',
        perc: 12,
        inv: 11,
        ins: 10,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/2hod.png"
    },
    {
        name: 'Эльф',
        game_id: 3,
        language: 'подземный эльфоовый',
        perc: 5,
        inv: 8,
        ins: 10,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/2hod.png"
    },
    {
        name: 'Иуда Искариот',
        game_id: 3,
        language: 'иврит целовательный, дотракийский',
        perc: 11,
        inv: 12,
        ins: 13,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/3hod.png"
    },
    {
        name: 'Крот',
        game_id: 3,
        language: 'кротиный английский эльфийский',
        perc: 13,
        inv: 14,
        ins: 3,
        imagestring: "https://ttovarischh.github.io/WikiMEDIUMM/images/img.png"
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

effects.each do |effect|
    effectarray = Effect.create(effect)
    puts "Some MAGIC just created a #{ effectarray.id } with name #{ effectarray.name }!"
end

games.each do |game|
    gamearray = Game.create(game)
    puts "Some MAGIC just created a #{ gamearray.id } with name #{ gamearray.name }!"
end

players.each do |player|
    playerarray = Player.create(player)
    puts "Some MAGIC just created a #{ playerarray.id } with name #{ playerarray.name }!"
end

monsters.each do |monster|
    monsterarray = Monster.create(monster)
    puts "Some MAGIC just created a #{ monsterarray.id } with name #{ monsterarray.name }!"
end



