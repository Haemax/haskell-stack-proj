:- dynamic imovel/6.
:- dynamic data/2.

criar_data(Id, Dia, Mes, Ano):-
    X is Dia,
    Y is Mes * 30,
    Z is Ano * 365,
    R is X + Y + Z,
    not(data(Id, _)),
    asserta(data(Id, R)).
criar_data.

criar_imovel(Nome, Tipo, Preco, Disp, Data_inicio, Data_fim):-
    not(imovel(Nome, _, _, _, _, _)),
    asserta(imovel(Nome, Tipo, Preco, Disp, Data_inicio, Data_fim)),
	salvar_imovel(Nome, Tipo, Preco, Disp, Data_inicio, Data_fim),
	nl, write('Imovel cadastrado com sucesso!'), nl.
criar_imovel.

salvar_imovel(Nome, Tipo, Preco, Disp, Data_inicio, Data_fim) :-
	open('imoveis.txt', append, Out),
    write(Out, Nome),
	write(Out, ", "),
	write(Out, Tipo),
	write(Out, ", "),
	write(Out, Preco),
	write(Out, ", "),
	write(Out, Disp),
	write(Out, ", "),
	write(Out, Data_inicio),
	write(Out, ", "),
	write(Out, Data_fim),
	write(Out, "."),
	nl(Out),
    close(Out). 
salvar_imovel.

reservar(NomeDoImovel, Periodo) :-
    imovel(NomeDoImovel, Tipo, Preco, "disponivel", Data_inicio, _),
    retract(imovel(NomeImovel, Tipo, Preco, "disponivel", Data_inicio, _)),
    X is Data_inicio + Periodo,
    asserta(imovel(NomeImovel, Tipo, Preco, "reservado", Data_inicio, X)),
    nl, write('Imovel reservado com sucesso!'), nl.
reservar.

reserva_imovel(Nome,Id_usuario,Data_inicio,Dias) :-
	open('imoveis_reserva.txt', append, Out),
    write(Out, Nome),
	write(Out, ", "),
	write(Out, Id_usuario),
	write(Out, ", "),
	write(Out, Data_inicio),
	write(Out, ", "),
	write(Out, Dias),
	nl(Out),
    close(Out). 
reserva_imovel.

cancelar_reserva(NomeDoImovel):-
    imovel(NomeDoImovel, Tipo, Preco, _, Data_inicio, Data_fim),
    retract(imovel(NomeDoImovel, _, _, _, _, _)),
    asserta(imovel(NomeDoImovel, Tipo, Preco, "disponivel", Data_inicio, Data_fim)),
    nl, write('Reserva cancelada com sucesso!'), nl.
cancelar_reserva.

/**listar_datas:-
    nl,
    data(Id, R),
    write(Id), write(' '), write(R), nl,
    fail.
listar_datas. **/

listar_imoveis_disponiveis :-
    nl,
    imovel(NomeDoImovel, Tipo, Preco, disponivel, _, _),
    write('Endereço do imovel: '), write(NomeDoImovel), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(disponivel), nl,
    write('------------------'), nl,
    fail.
listar_imoveis_disponiveis.

listar_imoveis_reservados :-
    nl,
    imovel(NomeDoImovel, Tipo, Preco, reservado, Data_inicio, Data_fim),
    write('Endereço do imovel: '), write(NomeDoImovel), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(reservado), nl,
    X is Data_fim - Data_inicio,
    write('Reservado pelos próximos: '), write(X), write(' dias.'), nl,
    write('------------------'), nl,
    fail.
listar_imoveis_reservados.

listar_imoveis_preco(PrecoMax):-
    nl,
    imovel(NomeDoImovel, Tipo, Preco, disponivel, _, _),
    Preco =< PrecoMax,
    write('Endereço do imovel: '), write(NomeDoImovel), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(disponivel), nl,
    write('------------------'), nl,
    fail.
listar_imoveis_preco(_) :-
    not(imovel(_, _, _, _, _, _)),
    !.

listar_imoveis_periodo(Data_inicio, Data_fim):-
    nl,
    imovel(NomeDoImovel, Tipo, Preco, disponivel, P1, P2),
    P1 >= Data_inicio,
    P2 =< Data_fim,
    write('Endereço do imovel: '), write(NomeDoImovel), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(disponivel), nl,
    write('------------------'), nl,
    fail.
listar_imoveis_periodo(_,_) :-
    not(imovel(_, _, _, _, _, _)),
    !.

menu_data:-
    nl,
    write('Por favor insira a data atual:'), nl,
    write('Dia:'), nl,
    read(Dia),
    write('Mês:'), nl,
    read(Mes),
    write('Ano:'), nl,
    read(Ano),
    criar_data(1, Dia, Mes, Ano).
menu_data.

menu_usuario :-
    nl,
    write('Bem-vindo ao sistema de reservas de imóveis'), nl,
    write('Escolha uma opção:'), nl,
    write('1. Cancelar reserva de imovel'), nl,
    write('2. Reservar imovel'), nl,
    write('3. Listar imoveis disponíveis'), nl,
    write('4. Pesquisar imoveis por preço'), nl,
    write('5. Pesquisar imoveis por período'), nl,
    write('6. Voltar'), nl,
    read(Opcao),
    (Opcao =:= 1 ->
        write('Digite o endereço do imóvel que deseja cancelar a reserva'), nl,
        read(NomeDoImovel),
        cancelar_reserva(NomeDoImovel)
    ; Opcao =:= 2 ->
        write('Digite o endereço do imóvel que deseja reservar:'), nl,
        read(NomeDoImovel),
        write('Digite seu nome:'), nl,
        read(Nome),
        write('Digite a data (Ex:dd/mm/aaaa):'), nl,
        read(Inicio),
        write('Por quantos dias você quer reservar?:'), nl,
        read(Periodo),
        reserva_imovel(NomeDoImovel,Nome,Inicio, Periodo)
    ; Opcao =:= 3 ->
        listar_imoveis_disponiveis
    ; Opcao =:= 4 ->
        write('Digite o preço máximo do imóvel:'), nl,
        read(PrecoMax),
        listar_imoveis_preco(PrecoMax)
    ; Opcao =:= 5 ->
        write('Digite a data de entrada (De): '), nl,
        write('Dia:'), nl,
        read(Dia1),
        write('Mês:'), nl,
        read(Mes1),
        write('Ano:'), nl,
        read(Ano1),
        retract(data(entrada, _)),
        criar_data(entrada, Dia1, Mes1, Ano1),

        write('Digite a data de saída (Até): '), nl,
        write('Dia:'), nl,
        read(Dia2),
        write('Mês:'), nl,
        read(Mes2),
        write('Ano:'), nl,
        read(Ano2),
        retract(data(saida, _)),
        criar_data(saida, Dia2, Mes2, Ano2),
        data(entrada, D1),
        data(saida, D2),
        listar_imoveis_periodo(D1, D2)

    ; Opcao =:= 6 ->
        menu_principal
    ;
        write('Opção inválida'), nl
    ),
    menu_usuario.

menu_adm :- 
    nl,
    write('Bem-vindo ao sistema de administração de imóveis'), nl,
    write('Escolha uma opção:'), nl,
    write('1. Criar Imóvel'), nl,
    write('2. Listar imoveis disponíveis'), nl,
    write('3. Listar imoveis reservados'), nl,
    write('4. Voltar'), nl,
    read(Opcao),
    (Opcao =:= 1 ->
        write('Digite o endereço do imóvel:'), nl,
        read(NomeImovel),
		write(NomeImovel), nl,
        write('Digite o tipo do imóvel:'), nl,
        read(Tipo),
        write('Digite o preço do imóvel:'), nl,
        read(Preco),
        write('Digite a disponibilidade do imóvel:'), nl,
        read(Disp),
        data(1, Dat),
        criar_imovel(NomeImovel, Tipo, Preco, Disp, Dat, _)
        
    ; Opcao =:= 2 ->
        listar_imoveis_disponiveis
    ; Opcao =:= 3 ->
        listar_imoveis_reservados
    ; Opcao =:= 4 ->
        menu_principal
    ;
        write('Opção inválida'), nl
    ),
    menu_adm.

menu_principal:-
    write('Bem Vindo!'), nl,
    write('Selecione uma opção:'), nl,
    write('1. Menu administração'), nl,
    write('2. Menu usuário'), nl,
    write('3. Sair'), nl,
    read(Opcao),
    (Opcao =:= 1 ->
        menu_adm
    ; Opcao =:= 2 ->
        menu_usuario
    ; Opcao =:= 3 ->
        halt
    ;
        write('Opção inválida'), nl
    ),
    menu_principal.

main :-
    cls,
    menu_data,
    init, 
    menu_principal.

init :-
    %criar_data(1, 1,1,1980),
    %data(1, DataAtual),
    criar_data(entrada, 1,1,1980),
    criar_data(saida, 1,1,1980),
    data(1, DataAtual),
    criar_imovel(1, solteiro, 100, disponivel, DataAtual, DataAtual).
    %criar_imovel(2, duplo, 200, disponivel, DataAtual, DataAtual),
    %criar_imovel(3, triplo, 300, disponivel, DataAtual, DataAtual).
init.

cls:-
    write('\33\[2J').
cls.
