/*Program for blinking LED
January 16,2021
Code by G V V Sharma
Released under GNU GPL
*/

//declaring the blink module
module helloworldfpga(
    output wire A,
    output wire B,
    output wire C,
    output wire D,
    output wire clock1,
    input wire W,
    input wire X
);
    wire clk;

   qlal4s3b_cell_macro u_qlal4s3b_cell_macro (
     .Sys_Clk0 (clk),
  );

    reg[26:0] delay;
    reg   input1=0; 
     reg   input2=0;
     reg clock1 = 0;
       always@( posedge clk) 
       // always@(*) 
        begin
	 //clock1 = 1;
         delay = delay+1; //incrementing the counter.
	    //counts from 0 to i20000000 n 1 second

	  // if(delay==27'b1001100010010110100000000) // blink delay in bits
	   if(delay > 20000000 ) //blink delay in decimal
	   begin
		delay=27'b0;
		B = !input2;
		A = ((input1)&(!input2)) | ((!input1)&(input2)) ;
		C = 0 ;
        	D = 0;
		clock1 = !clock1;
	 //  end

	//delay = delay+1; //incrementing the counter.
	//counts from 0 to 20000000 in 1 second

	//if(delay==27'b1001100010010110100000000) // blink delay in bits
	//if(delay > 20000000 ) //blink delay in decimal
	//begin
	
	//	delay=27'b0;
	if (clock1 == 0)
        begin		
	 input1 = W ;
	 input2 = X ;
	end
     end
    end
endmodule
//end of the module




