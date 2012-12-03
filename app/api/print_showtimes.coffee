program = require 'commander'

program
  .command('*')
  .action (parser) ->
    parser = require("./#{parser}")
    parser.example()

program.on('--help', ->
  console.log('  Examples:')
  console.log('')
  console.log('    $ print_showtimes google_movies')
  console.log('    $ print_showtimes arcoiris')
  console.log('')
)

program.parse(process.argv)

program.help() if program.args.length == 0