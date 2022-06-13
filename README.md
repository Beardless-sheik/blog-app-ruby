# Ruby Blog App

A simple blog app built using the Ruby on Rails framework.

## Built With

- Ruby on Rails
- PostgreSQL

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
  You need to have Ruby, rails instaled locally on your computer. Guides below: 

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)

### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### Development Database

```sh
# Create Postgres user and configure the database.yml file accordingly
sudo -u postgres createuser 'username'
# Create the database
rake db:create
```

### Install

```sh
bundle install
```

### Run

```sh
> npm run build:css (This build the scss style application packages)

> bin/rails server (This starts the development server)
```

### Test

```sh
rspec spec --format documentation
```

## Author

👤 **Alick Nyirenda**
- GitHub: [@Beardless-sheik](https://github.com/Beardless-sheik)
- Twitter: [@beardless_sheik](https://twitter.com/beardless_sheik)
- LinkedIn: [Alick Nyirenda](https://www.linkedin.com/in/alick-nyirenda/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## License

[MIT](./LICENSE)