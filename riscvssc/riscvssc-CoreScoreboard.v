//=========================================================================
// 7-Stage RISCV Scoreboard
//=========================================================================

`ifndef RISCV_CORE_SCOREBOARD_V
`define RISCV_CORE_SCOREBOARD_V

module riscv_CoreScoreboard
(
  input            clk              ,
  input            reset            ,

  input            inst_val_Dhl     ,

  input      [4:0] src00            ,
  input            src00_en         ,
  input      [4:0] src01            ,
  input            src01_en         ,
  input      [4:0] src10            ,
  input            src10_en         ,
  input      [4:0] src11            ,
  input            src11_en         ,

  output reg       stall_0_hazard   ,
  output reg       stall_1_hazard   ,

  output reg [3:0] src00_byp_mux_sel,
  output reg [3:0] src01_byp_mux_sel,
  output reg [3:0] src10_byp_mux_sel,
  output reg [3:0] src11_byp_mux_sel,

  input      [4:0] dstA             ,
  input            dstA_en          ,
  input            stall_A_Dhl      ,
  input            is_muldiv_A      ,
  input            is_load_A        ,

  input            stall_X0hl       ,
  input            stall_X1hl
);

  // TODO: implement your scoreboard here!

  integer i;

  reg valid_bits [0:31];
  reg func_bits  [0:31];
  reg is_muldiv  [0:31];
  reg is_load    [0:31];
  reg [4:0] pipe [0:31];

  reg [4:0] pipe0;
  reg [4:0] pipe1;
  reg [4:0] pipe2;
  reg [4:0] pipe3;
  reg [4:0] pipe4;
  reg [4:0] pipe5;
  reg [4:0] pipe6;
  reg [4:0] pipe7;
  reg [4:0] pipe8;
  reg [4:0] pipe9;
  reg [4:0] pipe10;
  reg [4:0] pipe11;
  reg [4:0] pipe12;
  reg [4:0] pipe13;
  reg [4:0] pipe14;
  reg [4:0] pipe15;
  reg [4:0] pipe16;
  reg [4:0] pipe17;
  reg [4:0] pipe18;
  reg [4:0] pipe19;
  reg [4:0] pipe20;
  reg [4:0] pipe21;
  reg [4:0] pipe22;
  reg [4:0] pipe23;
  reg [4:0] pipe24;
  reg [4:0] pipe25;
  reg [4:0] pipe26;
  reg [4:0] pipe27;
  reg [4:0] pipe28;
  reg [4:0] pipe29;
  reg [4:0] pipe30;
  reg [4:0] pipe31;
  reg muldiv0;
  reg muldiv1;
  reg muldiv2;
  reg muldiv3;
  reg muldiv4;
  reg muldiv5;
  reg muldiv6;
  reg muldiv7;
  reg muldiv8;
  reg muldiv9;
  reg muldiv10;
  reg muldiv11;
  reg muldiv12;
  reg muldiv13;
  reg muldiv14;
  reg muldiv15;
  reg muldiv16;
  reg muldiv17;
  reg muldiv18;
  reg muldiv19;
  reg muldiv20;
  reg muldiv21;
  reg muldiv22;
  reg muldiv23;
  reg muldiv24;
  reg muldiv25;
  reg muldiv26;
  reg muldiv27;
  reg muldiv28;
  reg muldiv29;
  reg muldiv30;
  reg muldiv31;
  reg valid0;
  reg valid1;
  reg valid2;
  reg valid3;
  reg valid4;
  reg valid5;
  reg valid6;
  reg valid7;
  reg valid8;
  reg valid9;
  reg valid10;
  reg valid11;
  reg valid12;
  reg valid13;
  reg valid14;
  reg valid15;
  reg valid16;
  reg valid17;
  reg valid18;
  reg valid19;
  reg valid20;
  reg valid21;
  reg valid22;
  reg valid23;
  reg valid24;
  reg valid25;
  reg valid26;
  reg valid27;
  reg valid28;
  reg valid29;
  reg valid30;
  reg valid31;


  always @(*) begin
    pipe0  = pipe[0];
    pipe1  = pipe[1];
    pipe2  = pipe[2];
    pipe3  = pipe[3];
    pipe4  = pipe[4];
    pipe5  = pipe[5];
    pipe6  = pipe[6];
    pipe7  = pipe[7];
    pipe8  = pipe[8];
    pipe9  = pipe[9];
    pipe10 = pipe[10];
    pipe11 = pipe[11];
    pipe12 = pipe[12];
    pipe13 = pipe[13];
    pipe14 = pipe[14];
    pipe15 = pipe[15];
    pipe16 = pipe[16];
    pipe17 = pipe[17];
    pipe18 = pipe[18];
    pipe19 = pipe[19];
    pipe20 = pipe[20];
    pipe21 = pipe[21];
    pipe22 = pipe[22];
    pipe23 = pipe[23];
    pipe24 = pipe[24];
    pipe25 = pipe[25];
    pipe26 = pipe[26];
    pipe27 = pipe[27];
    pipe28 = pipe[28];
    pipe29 = pipe[29];
    pipe30 = pipe[30];
    pipe31 = pipe[31];
    muldiv0  = is_muldiv[0];
    muldiv1  = is_muldiv[1];
    muldiv2  = is_muldiv[2];
    muldiv3  = is_muldiv[3];
    muldiv4  = is_muldiv[4];
    muldiv5  = is_muldiv[5];
    muldiv6  = is_muldiv[6];
    muldiv7  = is_muldiv[7];
    muldiv8  = is_muldiv[8];
    muldiv9  = is_muldiv[9];
    muldiv10  = is_muldiv[10];
    muldiv11  = is_muldiv[11];
    muldiv12  = is_muldiv[12];
    muldiv13  = is_muldiv[13];
    muldiv14  = is_muldiv[14];
    muldiv15  = is_muldiv[15];
    muldiv16  = is_muldiv[16];
    muldiv17  = is_muldiv[17];
    muldiv18  = is_muldiv[18];
    muldiv19  = is_muldiv[19];
    muldiv20  = is_muldiv[20];
    muldiv21  = is_muldiv[21];
    muldiv22  = is_muldiv[22];
    muldiv23  = is_muldiv[23];
    muldiv24  = is_muldiv[24];
    muldiv25  = is_muldiv[25];
    muldiv26  = is_muldiv[26];
    muldiv27  = is_muldiv[27];
    muldiv28  = is_muldiv[28];
    muldiv29  = is_muldiv[29];
    muldiv30  = is_muldiv[30];
    muldiv31  = is_muldiv[31];
    valid0 = valid_bits[0];
    valid1 = valid_bits[1];
    valid2 = valid_bits[2];
    valid3 = valid_bits[3];
    valid4 = valid_bits[4];
    valid5 = valid_bits[5];
    valid6 = valid_bits[6];
    valid7 = valid_bits[7];
    valid8 = valid_bits[8];
    valid9 = valid_bits[9];
    valid10 = valid_bits[10];
    valid11 = valid_bits[11];
    valid12 = valid_bits[12];
    valid13 = valid_bits[13];
    valid14 = valid_bits[14];
    valid15 = valid_bits[15];
    valid16 = valid_bits[16];
    valid17 = valid_bits[17];
    valid18 = valid_bits[18];
    valid19 = valid_bits[19];
    valid20 = valid_bits[20];
    valid21 = valid_bits[21];
    valid22 = valid_bits[22];
    valid23 = valid_bits[23];
    valid24 = valid_bits[24];
    valid25 = valid_bits[25];
    valid26 = valid_bits[26];
    valid27 = valid_bits[27];
    valid28 = valid_bits[28];
    valid29 = valid_bits[29];
    valid30 = valid_bits[30];
    valid31 = valid_bits[31];
  end

  always @( posedge clk ) begin
    if (reset) begin
      for (i = 0; i < 32; i = i + 1) begin
          valid_bits[i] <= 1'b0;
          func_bits[i]  <= 1'b0;
          is_muldiv[i]  <= 1'b0;
          is_load[i]    <= 1'b0;
          pipe[i]       <= 5'b0;
      end
    end
    else begin
      for (i = 1; i < 32; i = i + 1) begin
        if(dstA_en && (i == dstA) && inst_val_Dhl && !stall_A_Dhl) begin
          valid_bits[dstA] <= 1'b1;
          func_bits[dstA]  <= 1'b0;
          is_muldiv[dstA]  <= is_muldiv_A;
          is_load[dstA]    <= is_load_A;
          pipe[dstA][4]    <= 1'b1;
        end
        else begin
          if (valid_bits[i]) begin
            if (pipe[i] == 5'b00001) begin
              pipe[i]   <= 5'b0;
              valid_bits[i] <= 1'b0;
              func_bits[i]  <= 1'b0;
              is_muldiv[i]  <= 1'b0;
              is_load[i]    <= 1'b0;
            end
            else if (stall_X1hl) begin
              pipe[i][0] <= pipe[i][1];
              pipe[i][1] <= pipe[i][2];
              pipe[i][2] <= 1'b0;
            end
            else if (stall_X0hl) begin
              pipe[i][0] <= pipe[i][1];
              pipe[i][1] <= pipe[i][2];
              pipe[i][2] <= pipe[i][3];
              pipe[i][3] <= 1'b0;
            end
            else begin
              pipe[i][0] <= pipe[i][1];
              pipe[i][1] <= pipe[i][2];
              pipe[i][2] <= pipe[i][3];
              pipe[i][3] <= pipe[i][4];
              pipe[i][4] <= 1'b0;
            end
          end
        end
      end
    end
  end

always @(*) begin
  if (src00_en) begin
    src00_byp_mux_sel = clo(pipe[src00]);
  end
  if (src01_en) begin
    src01_byp_mux_sel = clo(pipe[src01]);
  end
  if (src10_en) begin
    src10_byp_mux_sel = clo(pipe[src10]);
  end
  if (src11_en) begin
    src11_byp_mux_sel = clo(pipe[src11]);
  end
end

always @(*) begin
  stall_0_hazard = 1'b0;
  stall_1_hazard = 1'b0;

  if ((src00_en && is_muldiv[src00] && ((clo(pipe[src00]) < 4) || (clo(pipe[src00]) == 0)))
   || (src01_en && is_muldiv[src01] && ((clo(pipe[src01]) < 4) || (clo(pipe[src01]) == 0)))
   || (src00_en && is_load[src00] && ((clo(pipe[src00]) < 2) || (clo(pipe[src00]) == 0)))
   || (src01_en && is_load[src01] && ((clo(pipe[src01]) < 2) || (clo(pipe[src01]) == 0)))) begin
    stall_0_hazard = 1'b1;
  end
  if ((src10_en && is_muldiv[src10] && ((clo(pipe[src10]) < 4) || (clo(pipe[src10]) == 0)))
   || (src11_en && is_muldiv[src11] && ((clo(pipe[src11]) < 4) || (clo(pipe[src11]) == 0)))
   || (src10_en && is_load[src10] && ((clo(pipe[src10]) < 2) || (clo(pipe[src10]) == 0)))
   || (src11_en && is_load[src11] && ((clo(pipe[src11]) < 2) || (clo(pipe[src11]) == 0)))) begin
    stall_1_hazard = 1'b1;
  end
end

function [3:0] clo (input [4:0] value);
  begin
    casez (value)
      5'b1????: clo = 4'd1;
      5'b01???: clo = 4'd2;
      5'b001??: clo = 4'd3;
      5'b0001?: clo = 4'd4;
      5'b00001: clo = 4'd5;
      5'b00000: clo = 4'd0;
      default : clo = 4'd0;
    endcase
  end
endfunction

endmodule

`endif
