
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

