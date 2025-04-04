// Code your design here
module cnt8(clk, reset, pl,encnt,inc,dec,cin,con,din,dout);
  
  input clk, reset, pl,encnt,inc,dec,cin;
  output con;
  input [7:0]din;
  output reg [7:0] dout;
  
  always @(posedge clk)
    if(reset)
      if(inc)
      	dout <= 8'h0;
  	  else
        dout <= 8'hff;
  	else
      if(pl)
        dout <= din;
  	  else
        if((~cin) & encnt))
          if(inc)
            dout <= dout + 1;
  		  else
            dout <= dout - 1;
  		else
          if((~con))
            if(inc)
              dout <= 8'h0;
  			else
              dout <= 8'hff;
  
  assign con = (~(dout === 8'hff) & encnt & inc &(~cin)) & (~(dout == 8'h0) & encnt & dec & (~cin));
          
endmodule