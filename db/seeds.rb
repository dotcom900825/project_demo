# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

articles = Article.create([{ :name => 'As We May Think',
                             :description => 'As We May Think is an essay by Vannevar Bush,  Bush
                                           expresses his concern for the direction of scientific efforts
                                           toward destruction, rather than understanding, and explicates
                                           a desire for a sort of collective memory machine with his concept
                                           of the memex that would make knowledge more accessible, believing
                                           that it would help fix these problems. Through this machine, Bush
                                           hoped to transform an information explosion into a knowledge
                                           explosion.',
                              :url => 'http://dl.acm.org/citation.cfm?doid=227181.227186',
                              :author => 'Vannevar Bush'
                            },
                            {
                              :name => 'The Computer for the 21st Century',
                              :description => 'Specialized elements of hardware and software, connected by
                                            wires, radio waves and infrared, will be so ubiquitous that
                                            no one will notice their presence.',
                              :author => 'Mark Weiser'
                              }])
