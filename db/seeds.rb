# encoding: UTF-8

Team.delete_all
brasil = Team.create(name: 'Brasil', coach: 'Luiz Felipe Scolari', group: 'A')
croacia = Team.create(name: 'Croacia', coach: 'Niko Kovac', group: 'A')
mexico = Team.create(name: 'Mexico', coach: 'Miguel Herrera', group: 'A')
camerun = Team.create(name: 'Camerun', coach: 'Volker Finke', group: 'A')

espana = Team.create(name: 'España', coach: 'Vicente del Bosque', group: 'B')
holanda = Team.create(name: 'Holanda', coach: 'Louis van Gaal', group: 'B')
chile = Team.create(name: 'Chile', coach: 'Jorge Sampaoli', group: 'B')
australia = Team.create(name: 'Australia', coach: 'Ange Postecoglou', group: 'B')

colombia = Team.create(name: 'Colombia', coach: 'Jose Pekerman', group: 'C')
grecia = Team.create(name: 'Grecia', coach: 'Fernando Santos', group: 'C')
marfil = Team.create(name: 'C de Marfil', coach: 'Sabri Lamouchi', group: 'C')
japon = Team.create(name: 'Japon', coach: 'Alberto Zaccheroni', group: 'C')

uruguay = Team.create(name: 'Uruguay', coach: 'Oscar Washington Tabarez', group: 'D')
costarica = Team.create(name: 'Costa Rica', coach: 'Jorge Luis Pinto', group: 'D')
inglaterra = Team.create(name: 'Inglaterra', coach: 'Roy Hodgson', group: 'D')
italia = Team.create(name: 'Italia', coach: 'Cesare Prandelli', group: 'D')

suiza = Team.create(name: 'Suiza', coach: 'Ottmar Hitzfeld', group: 'E')
ecuador = Team.create(name: 'Ecuador', coach: 'Reinaldo Rueda', group: 'E')
francia = Team.create(name: 'Francia', coach: 'Didier Deschamps', group: 'E')
honduras = Team.create(name: 'Honduras', coach: 'Luis Fernando Suarez', group: 'E')

argentina = Team.create(name: 'Argentina', coach: 'Alejandro Sabella', group: 'F')
bosnia = Team.create(name: 'Bosnia', coach: 'Safet Susic', group: 'F')
iran = Team.create(name: 'Iran', coach: 'Carlos Queiroz', group: 'F')
nigeria = Team.create(name: 'Nigeria', coach: 'Stephen Keshi', group: 'F')

alemania = Team.create(name: 'Alemania', coach: 'Joachim Low', group: 'G')
portugal = Team.create(name: 'Portugal', coach: 'Paulo Bento', group: 'G')
ghana = Team.create(name: 'Ghana', coach: 'James Kwesi Appiah', group: 'G')
usa = Team.create(name: 'USA', coach: 'Jurgen Klinsmann', group: 'G')

belgica = Team.create(name: 'Belgica', coach: 'Marc Wilmots', group: 'H')
argelia = Team.create(name: 'Argelia', coach: 'Vahid Halilhodzic', group: 'H')
rusia = Team.create(name: 'Rusia', coach: 'Fabio Capello', group: 'H')
corea = Team.create(name: 'Corea del S', coach: 'Hong Myung-bo', group: 'H')

Arena.delete_all
Arena.create(name: 'Arena Mineirao', city: 'Belo Horizonte', capacity: 69950)
Arena.create(name: 'Estadio Mane Garrincha', city: 'Brasilia', capacity: 70807)
Arena.create(name: 'Arena Pantanal', city: 'Cuiaba', capacity: 42500)
Arena.create(name: 'Arena da Baixada', city: 'Curitiba', capacity: 41375)
Arena.create(name: 'Estadio Castelao', city: 'Fortaleza', capacity: 60000)
Arena.create(name: 'Estadio Vivaldo Lima', city: 'Manaos', capacity: 50000)
Arena.create(name: 'Estadio das Dunas', city: 'Natal', capacity: 45000)
Arena.create(name: 'Estadio Beira-Rio', city: 'Porto Alegre', capacity: 60000)
Arena.create(name: 'Arena Pernambuco', city: 'Recife', capacity: 46154)
Arena.create(name: 'Estadio Maracana', city: 'Rio de Janeiro', capacity: 76525)
Arena.create(name: 'Arena Fonte Nova', city: 'Salvador', capacity: 50433)
Arena.create(name: 'Arena de Sao Paulo', city: 'San Pablo', capacity: 65281)

Match.delete_all
Forecast.delete_all
Match.create(team1_id: brasil.id, team2_id: croacia.id, group: 'A')
Match.create(team1_id: mexico.id, team2_id: camerun.id, group: 'A')
Match.create(team1_id: brasil.id, team2_id: mexico.id, group: 'A')
Match.create(team1_id: croacia.id, team2_id: camerun.id, group: 'A')
Match.create(team1_id: brasil.id, team2_id: camerun.id, group: 'A')
Match.create(team1_id: croacia.id, team2_id: mexico.id, group: 'A')

Match.create(team1_id: espana.id, team2_id: holanda.id, group: 'B')
Match.create(team1_id: chile.id, team2_id: australia.id, group: 'B')
Match.create(team1_id: espana.id, team2_id: chile.id, group: 'B')
Match.create(team1_id: holanda.id, team2_id: australia.id, group: 'B')
Match.create(team1_id: espana.id, team2_id: australia.id, group: 'B')
Match.create(team1_id: holanda.id, team2_id: chile.id, group: 'B')

Match.create(team1_id: colombia.id, team2_id: grecia.id, group: 'C')
Match.create(team1_id: marfil.id, team2_id: japon.id, group: 'C')
Match.create(team1_id: colombia.id, team2_id: marfil.id, group: 'C')
Match.create(team1_id: grecia.id, team2_id: japon.id, group: 'C')
Match.create(team1_id: colombia.id, team2_id: japon.id, group: 'C')
Match.create(team1_id: grecia.id, team2_id: marfil.id, group: 'C')

Match.create(team1_id: uruguay.id, team2_id: costarica.id, group: 'D')
Match.create(team1_id: inglaterra.id, team2_id: italia.id, group: 'D')
Match.create(team1_id: uruguay.id, team2_id: inglaterra.id, group: 'D')
Match.create(team1_id: costarica.id, team2_id: italia.id, group: 'D')
Match.create(team1_id: uruguay.id, team2_id: italia.id, group: 'D')
Match.create(team1_id: costarica.id, team2_id: inglaterra.id, group: 'D')

Match.create(team1_id: suiza.id, team2_id: ecuador.id, group: 'E')
Match.create(team1_id: francia.id, team2_id: honduras.id, group: 'E')
Match.create(team1_id: suiza.id, team2_id: francia.id, group: 'E')
Match.create(team1_id: ecuador.id, team2_id: honduras.id, group: 'E')
Match.create(team1_id: suiza.id, team2_id: honduras.id, group: 'E')
Match.create(team1_id: ecuador.id, team2_id: francia.id, group: 'E')

Match.create(team1_id: argentina.id, team2_id: bosnia.id, group: 'F')
Match.create(team1_id: iran.id, team2_id: nigeria.id, group: 'F')
Match.create(team1_id: argentina.id, team2_id: iran.id, group: 'F')
Match.create(team1_id: bosnia.id, team2_id: nigeria.id, group: 'F')
Match.create(team1_id: argentina.id, team2_id: nigeria.id, group: 'F')
Match.create(team1_id: bosnia.id, team2_id: iran.id, group: 'F')

Match.create(team1_id: alemania.id, team2_id: portugal.id, group: 'G')
Match.create(team1_id: ghana.id, team2_id: usa.id, group: 'G')
Match.create(team1_id: alemania.id, team2_id: ghana.id, group: 'G')
Match.create(team1_id: portugal.id, team2_id: usa.id, group: 'G')
Match.create(team1_id: alemania.id, team2_id: usa.id, group: 'G')
Match.create(team1_id: portugal.id, team2_id: ghana.id, group: 'G')

Match.create(team1_id: belgica.id, team2_id: argelia.id, group: 'H')
Match.create(team1_id: rusia.id, team2_id: corea.id, group: 'H')
Match.create(team1_id: belgica.id, team2_id: rusia.id, group: 'H')
Match.create(team1_id: argelia.id, team2_id: corea.id, group: 'H')
Match.create(team1_id: belgica.id, team2_id: corea.id, group: 'H')
Match.create(team1_id: argelia.id, team2_id: rusia.id, group: 'H')

MemberGroup.delete_all
MemberGroup.create(group_name: 'Test Group 1', token: '1234')
MemberGroup.create(group_name: 'Test Group 2', token: 'ABCD')