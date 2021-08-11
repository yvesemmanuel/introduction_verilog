module comparator_4bit(LT_IN, EQ_IN, GT_IN,
                       LT_OUT, EQ_OUT, GT_OUT, A, B);
  input EQ_IN, GT_IN, LT_IN;
  input [3:0] A, B;
  output reg EQ_OUT, GT_OUT, LT_OUT;
  
  initial // INICIALIZANDO OS VALORES DA SAÍDA COMO ZERO 
          // PARA NÃO GERAR CONFUSÃO NA CASCATA
    begin
      LT_OUT = 0; EQ_OUT = 0; GT_OUT = 0;
    end

  always @(A, B, EQ_IN, GT_IN, LT_IN) // ENTRADAS SENSÍVEIS À SAÍDA
    begin
      if (A < B)
        begin
          LT_OUT = 1; EQ_OUT = 0; GT_OUT = 0;
        end
      else if (A > B)
        begin
          LT_OUT = 0; EQ_OUT = 0; GT_OUT = 1;
        end
      // A PARTIR DAQUI NÃO É NECESSÁRIO COMPARAR A IGUALDADE,
      // POIS SABEMOS QUE SE CHEGAR ATÉ AQUI É PORQUE SÃO IGUAIS
      
      // SAÍDA PARA CASCATA OU RESPOSTA FINAL
      else if (GT_IN == 1)
        begin
          LT_OUT = 0; EQ_OUT = 0; GT_OUT = 1;
        end
      else if (LT_IN == 1)
        begin
          LT_OUT = 1; EQ_OUT = 0; GT_OUT = 0;
        end
      else // SÓ RESTA SEREM IGUAIS
        begin
          LT_OUT = 0; EQ_OUT = 1; GT_OUT = 0;
        end
    end
endmodule