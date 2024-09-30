
-- Atividade Aula 9 

-- FUNCAO QUE VERIFICA SE UM NUM É multiplo de 3
-- Exercicio 1.1
DROP FUNCTION numero_multiplo_de_3;

CREATE OR REPLACE FUNCTION numero_multiplo_de_3(numero INT)
RETURNS text -- Retorna texto com a msg.
AS $$
BEGIN
	IF numero % 3 = 0 THEN
	 RETURN 'O número é multiplo de 3';
	ELSE 
	 RETURN 'O número NÃO é múltiplo de 3';
	END IF;
END;
$$ LANGUAGE plpgsql;

-- Chama e testa a função
SELECT numero_multiplo_de_3(9);


-- Exercicio 1.2
DROP FUNCTION numero_multiplo_de_5ou3;

CREATE OR REPLACE FUNCTION numero_multiplo_de_5ou3(numero INT)
RETURNS text -- Retorna texto com msg.
AS $$
BEGIN
	IF numero % 5 = 0 or numero % 5 = 0 THEN
	 RETURN 'O Número é multiplo de 3 ou 5';
	ELSE
	 RETURN 'O Número NÃO é multiplo de 3 ou 5';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Chama e testa a função
SELECT numero_multiplo_de_5ou3(25);

-- Exercicio 1.3
CREATE OR REPLACE FUNCTION calculadora()
RETURNS text
AS $$
DECLARE
    numero1 INT;
    numero2 INT;
    operacao INT;
    resultado INT;
    operador TEXT;
BEGIN

    RAISE NOTICE 'Escolha uma operação:';
    RAISE NOTICE '1 - Soma';
    RAISE NOTICE '2 - Subtração';
    RAISE NOTICE '3 - Multiplicação';
    RAISE NOTICE '4 - Divisão';
    
    operacao := 1; 
    numero1 := 2; 
    numero2 := 3; 

    IF operacao = 1 THEN
        resultado := numero1 + numero2;
        operador := '+';
    ELSIF operacao = 2 THEN
        resultado := numero1 - numero2;
        operador := '-';
    ELSIF operacao = 3 THEN
        resultado := numero1 * numero2;
        operador := '*';
    ELSIF operacao = 4 THEN
        IF numero2 = 0 THEN
            RAISE NOTICE 'Erro: Divisão por zero!';
            RETURN;
        ELSE
            resultado := numero1 / numero2;
            operador := '/';
        END IF;
    ELSE
        RAISE NOTICE 'Operação inválida!';
        RETURN;
    END IF;

    RAISE NOTICE '% % % = %', numero1, operador, numero2, resultado;
END;
$$ LANGUAGE plpgsql;


-- Exercicio 1.4 
CREATE OR REPLACE FUNCTION calculaValorDeVenda(custo NUMERIC)
RETURNS NUMERIC AS $$
DECLARE
    valor_venda NUMERIC;
BEGIN
    IF custo < 20 THEN
        valor_venda := custo * 1.45; 
    ELSE
        valor_venda := custo * 1.30; 
    END IF;

    RETURN valor_venda;
END;
$$ LANGUAGE plpgsql;

-- Chama e testa a funcao()
SELECT calculaValorDeVenda(30);



-- Solucao do desafio 1.5:

CREATE OR REPLACE FUNCTION calculaSalario()
RETURNS NUMERIC AS $$
DECLARE
    salarioAtual NUMERIC;
    salarioReajus NUMERIC;
    raise_amount NUMERIC;
    porcentagem NUMERIC;
BEGIN
    salarioAtual := 1000.00;  

    IF salarioAtual <= 400.00 THEN
        porcentagem := 15;
    ELSIF salarioAtual <= 800.00 THEN
        porcentagem := 12;
    ELSIF salarioAtual <= 1200.00 THEN
        porcentagem := 10;
    ELSIF salarioAtual <= 2000.00 THEN
        porcentagem := 7;
    ELSE
        porcentagem := 4;
    END IF;

    raise_amount := (salarioAtual * porcentagem) / 100;
    salarioReajus := salarioAtual + raise_amount;

    RAISE NOTICE 'Salario Atual: %.2f', salarioAtual;
    RAISE NOTICE 'Salario Reajustado: %.2f', salarioReajus;
    RAISE NOTICE 'Aumento Sal.: %.2f', raise_amount;
    RAISE NOTICE 'Porcentagem: %.0f%%', porcentagem;
	RETURN salarioReajus;
	
END;
$$ LANGUAGE plpgsql;



