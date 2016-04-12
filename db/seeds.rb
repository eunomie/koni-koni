# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
organization = Organization.create name: 'Eunomie'
teams = Team.create [{ name: 'Koni', organization: organization },
                     { name: 'Nout', organization: organization }]
users = User.create [{ name: 'Global user', email: 'global@eunomie.info', password: 'global', organization: organization },
                     { name: 'Koni user',   email: 'koni@eunomie.info',   password: 'koni',   organization: organization, team: teams[0] },
                     { name: 'Nout user',   email: 'nout@eunomie.info',   password: 'nout',   organization: organization, team: teams[1] }]
