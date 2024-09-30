
-- Atividade Aula 9 
--
-- FUNCAO QUE VERIFICA SE UM NUM É multiplo de 3
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

-- Chama a função p/ teste
SELECT numero_multiplo_de_3(9);
