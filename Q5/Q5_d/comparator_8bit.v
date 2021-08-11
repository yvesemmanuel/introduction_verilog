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

module comparator_8bit(LT_IN, EQ_IN, GT_IN,
                       LT_OUT, EQ_OUT, GT_OUT, A, B);
  input EQ_IN, GT_IN, LT_IN;
  input [7:0] A, B;
  // FIOS DA PRIMEIRA COMPARAÇÃO (BITS 0-3)
  wire LT1, EQ1, GT1;
  // FIOS DA SEGUNDA COMPARAÇÃO (BITS 4-7)
  output LT_OUT, EQ_OUT, GT_OUT;
  
  // CASCATA ; INSTÂNCIAS DOS 2 COMPARADORES DE 4 BITS
  comparator_4bit C1(LT_IN, EQ_IN, GT_IN, LT1, EQ1,
                     GT1, A[3:0], B[3:0]);
  comparator_4bit C2(LT1, EQ1, GT1, LT_OUT, EQ_OUT,
                     GT_OUT, A[7:4], B[7:4]);
endmodule