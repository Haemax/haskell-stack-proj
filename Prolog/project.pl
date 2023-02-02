:- dynamic imovel/4.

criar_imovel(Nome, Tipo, Preco, Disp):-
    asserta(imovel(Nome, Tipo, Preco, Disp)).

reservar(NomeImovel) :-
    imovel(NomeImovel, _, _, disponivel),
    retract(imovel(NomeImovel, Tipo, Preco, disponivel)),
    asserta(imovel(NomeImovel, Tipo, Preco, reservado)),
    write('Imovel reservado com sucesso!'), nl.

listar_imoveis_disponiveis :-
    imovel(NomeDoImovel, Tipo, Preco, disponivel),
    write('Nome do imovel: '), write(NomeDoImovel), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(disponivel), nl,
    write('------------------'), nl,
    fail.
listar_imoveis_disponiveis.

listar_imoveis_reservados :-
    imovel(NomeDoImovel, Tipo, Preco, reservado),
    write('Nome do imovel: '), write(NomeDoImovel), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(reservado), nl,
    write('------------------'), nl,
    fail.
listar_imoveis_reservados.

listar_imoveis_preco(PrecoMax):-
    imovel(NomeDoImovel, Tipo, Preco, disponivel),
    Preco =< PrecoMax,
    write('Nome do imovel: '), write(NomeDoImovel), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(disponivel), nl,
    write('------------------'), nl,
    fail.
listar_imoveis_preco(_) :-
    not(imovel(_, _, _, _)),
    !.


menu_usuario :-
    write('Bem-vindo ao sistema de reservas de imóveis'), nl,
    write('Escolha uma opção:'), nl,
    write('1. Reservar imovel'), nl,
    write('2. Listar imoveis disponíveis'), nl,
    write('3. Pesquisar imoveis por preço'), nl,
    write('4. Voltar'), nl,
    read(Opcao),
    (Opcao =:= 1 ->
        write('Digite o Nome do imovel que deseja reservar:'), nl,
        read(NomeDoImovel),
        reservar(NomeDoImovel)
    ; Opcao =:= 2 ->
        listar_imoveis_disponiveis
    ; Opcao =:= 3 ->
        write('Digite o preço máximo do imóvel:'), nl,
        read(PrecoMax),
        listar_imoveis_preco(PrecoMax)
    ; Opcao =:= 4 ->
        main
    ;
        write('Opção inválida'), nl
    ),
    menu_usuario.

menu_adm :- 
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
        write('Digite o tipo do imóvel:'), nl,
        read(Tipo),
        write('Digite o preço do imóvel:'), nl,
        read(Preco),
        write('Digite a disponibilidade do imóvel:'), nl,
        read(Disp),
        criar_imovel(NomeImovel, Tipo, Preco, Disp)
        
    ; Opcao =:= 2 ->
        listar_imoveis_disponiveis
    ; Opcao =:= 3 ->
        listar_imoveis_reservados
    ; Opcao =:= 4 ->
        main
    ;
        write('Opção inválida'), nl
    ),
    menu_adm.

main :-
    criar_imovel(1, solteiro, 100, disponivel),
    criar_imovel(2, duplo, 200, disponivel),
    criar_imovel(3, triplo, 300, disponivel),

    write('Bem Vindo!'), nl,
    write('Selecione uma opção:'), nl,
    write('1. Menu administração'), nl,
    write('2. Menu usuário'), nl,
    read(Opcao),
    (Opcao =:= 1 ->
        menu_adm
    ; Opcao =:= 2 ->
        menu_usuario
    ;
        write('Opção inválida'), nl
    ),
    main.


