

-- exercícios da marion uhu 

-- exercicio 01

declare
	@cambio numeric(5,2) = 5.10,
	@dolar numeric = 45;
declare
	@resultado numeric(5,2) = @dolar * @cambio;
begin
	print @resultado
end;

-- exercicio 02

declare
	@montante numeric(10,2) = 10000;
declare
	@juro numeric(10,2) = @montante * 0.03;
declare
	@parcela numeric(10,2) = (@montante + @juro)/10;
begin
	print @parcela
end;

-- exercicio 03

declare
	@montanteInicial numeric(10,2) = 10000,
	@parcela numeric(10,2);
declare
	@montanteFinal numeric(10,2) = @montanteInicial - @montanteInicial * 0.2,
	@juro numeric(10,2);
begin  
	print '6 parcelas = ' + cast(@montanteFinal + @montanteFinal * 0.1 as varchar)
	print '12 parcelas = ' + cast(@montanteFinal + @montanteFinal * 0.15 as varchar)
	print '18 parcelas = ' + cast(@montanteFinal + @montanteFinal * 0.2 as varchar)
end;


-- exercicio 04

declare 
	@salario numeric(10,2) = 1500,
	@resultado numeric(10,2),
	@aliquota numeric(10,2),
	@IRPF numeric(10,2);
begin
	if @salario <= 1313.69
	begin 
		set @aliquota = 0
	end;
	if @salario <= 2625.12
	begin 
		set @aliquota = 0.15
	end;
	else
	begin 
		set @aliquota = 0.275
	end;
	set @IRPF = @salario * @aliquota 
	print 'salario liquido = ' + cast(@salario - @IRPF as varchar)
end;