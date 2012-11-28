program = require('commander')

program
  .command('*')
  .action (parser) ->
    parser = require("./#{parser}")
    parser.example()

program.on('--help', ->
  console.log('  Examples:')
  console.log('')
  console.log('    $ print_showtimes google')
  console.log('')
)

program.parse(process.argv)

program.help() if program.args.length == 0