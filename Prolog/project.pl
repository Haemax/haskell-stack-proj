:- dynamic quarto/4.

criar_quarto(Numero, Tipo, Preco, Disp):-
    asserta(quarto(Numero, Tipo, Preco, Disp)).

reservar(NumeroDoQuarto) :-
    quarto(NumeroDoQuarto, _, _, disponível),
    retract(quarto(NumeroDoQuarto, Tipo, Preco, disponível)),
    asserta(quarto(NumeroDoQuarto, Tipo, Preco, reservado)),
    write('Quarto reservado com sucesso!'), nl.

listar_quartos_disponiveis :-
    quarto(NumeroDoQuarto, Tipo, Preco, disponível),
    write('Numero do quarto: '), write(NumeroDoQuarto), nl,
    write('Tipo: '), write(Tipo), nl,
    write('Preco da diária: '), write(Preco), nl,
    write('Disponibilidade: '), write(disponível), nl,
    write('------------------'), nl,
    fail.
listar_quartos_disponiveis.

main :-
    write('Bem-vindo ao sistema de reservas de quartos'), nl,
    write('Escolha uma opção:'), nl,
    write('1. Reservar quarto'), nl,
    write('2. Listar quartos disponíveis'), nl,
    read(Opcao),
    (Opcao =:= 1 ->
        write('Digite o número do quarto que deseja reservar:'), nl,
        read(NumeroDoQuarto),
        reservar(NumeroDoQuarto)
    ; Opcao =:= 2 ->
        listar_quartos_disponiveis
    ;
        write('Opção inválida'), nl
    ),
    main.

