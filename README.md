# HOD API
Ruby on Rails part for the best D&amp;D tracker ever → → →<br>
*HOD is an iOS & web app for tracking initiative, number of moves, and ongoing states for D&D players.  
The application counts all the necessary numbers for the master, allows players to synchronously follow the game process, and makes your hobby more accessible than ever.*

Σ>―(〃°ω°〃)♡→

## 🤙 Main information & links

### Our long journey → → →<br>

+ <a href="https://portfolio.hse.ru/Project/168785">INTERFACE</a><br>
+ <a href="https://portfolio.hse.ru/Project/161194">IDENTITY</a><br>
+ <a href="https://portfolio.hse.ru/Project/149630">BRAND PLATFORM & IDEA</a>
+ <a href="https://portfolio.hse.ru/Project/149630">FINAL DECK</a>

### Other repos → → →<br>

+ <a href="https://github.com/ttovarischh/Hod_Mobile">Hod-Mobile</a><br>
+ <a href="https://github.com/ttovarischh/Hod-Web">Hod-Web</a><br>

### Our team → → →<br>
+ <a href="https://hsedesign.ru/designer/fcf7466f5b72474c982ecf2c7d5b9c70">🏃‍♀ Efremova Maria</a><br>
+ <a href="https://hsedesign.ru/designer/c968d54daa194b508e2d136bd75b77c4">⛹️‍♀️ Sysolyatina Nadya</a><br>
+ <a href="https://ttovarischh.com/">🤸 Sotnikova Polina</a><br>

## 🧾 SETUP INSTRUCTIONS FOR THIS PROJECT

### 1. Install [Ruby on Rails](https://rubyonrails.org/)

**💻 For Windows:**
1. Go to [guides.rubyonrails.org](https://guides.rubyonrails.org/install_ruby_on_rails.html#install-ruby-on-windows).
2. Follow the instructions for Windows
3. Verify your Ruby install
```
$ ruby --version
ruby 3.3.6
```
3. Install Rails from the same instruction
4. Verify that Rails is installed correctly
```
$ rails --version
Rails 8.0.0
```


**🍎 For Mac:**
1. Go to [guides.rubyonrails.org](https://guides.rubyonrails.org/install_ruby_on_rails.html#install-ruby-on-windows).
2. Follow the instructions for Mac
3. Verify your Ruby install
```
$ ruby --version
ruby 3.3.6
```
4. Install Rails from the same instruction
5. Verify that Rails is installed correctly
```
$ rails --version
Rails 8.0.0
```

**Important note: this project uses Ruby 2.6.10. If u have any problems launching project, try downgrading to 2.6.10.**

### 2. Install [Redis](https://redis.io/)
This app requires Redis to be running alongside the Rails server. Required for ActionCable, JWT, caching, etc.
🛠 We recommend using a Ruby version manager like [mise](https://github.com/jdx/mise) or rbenv to switch between Ruby versions easily.

**💻 For Windows:**
1. Open another Ubuntu terminal. Type these commands:
```
$ sudo apt update
$ sudo apt install redis-server
```
2. Start Redis manually:
```
$ sudo service redis-server start
```
3. Check if Redis is running:
```
$ redis-cli ping
→ PONG
```
4. To stop Redis
```
$ sudo service redis-server stop
```


**🍎 For Mac:**
1. Install Redis (via Homebrew)
```
$ brew install redis
```
3. Start Redis manually
```
$ brew services start redis
```
To check that it's running:
```
$ redis-cli ping
→ PONG
```
4. To stop Redis
```
$ brew services stop redis
```

### 3. Clone the project
If you haven't done this yet, go to the folder where you want to keep the code and run:

```
cd destination-folder-name
git clone https://github.com/ttovarischh/this-repo-name.git
```

(Or just download the zip from GitHub and unzip it)

### 4. Launch project
1. Open your terminal (Mac) or Ubuntu terminal (Windows).
2. Go to repository location, for example for me it's:
```
cd /mnt/c/Users/User/Documents/Hod-API
```
3. Download all dependencies with:
```
$ bundle install
```
4. Create db and seed neccessary data in it using this commands:
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
⚠️ Note: Seeded user passwords are for testing only. Don't reuse them in production.

4. You can now start the server
```
$ rails s
```

### 5. (Optional) Check if seeded data exists. For example:

+ **All users** -> http://localhost:3000/api/v1/effects
+ **All games** -> http://localhost:3000/api/v1/games
+ **All effects** -> http://localhost:3000/api/v1/effects

Optionally you can also use Postman or rails console to check it.

### 6. (Optional) Stop rails server

```
Ctrl + C
```

## Perfect, now you can start Web or iOs app to try and play.

**Again:**
+ <a href="https://github.com/ttovarischh/Hod_Mobile">Hod-Mobile</a><br>
+ <a href="https://github.com/ttovarischh/Hod-Web">Hod-Web</a><br>

**You’re good to go if:**
- Rails server is running on `localhost:3000`
- Redis replies `PONG`
- Seeded data shows up at routes


σ(￣、￣〃)

Keep it rolling!
