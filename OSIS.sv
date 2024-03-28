logic [9:0]OSISnum0[3:0],OSISnum1[3:0],OSISnum2[3:0],OSISnum3[3:0],OSISnum4[3:0],OSISnum5[3:0],OSISnum6[3:0],OSISnum7[3:0],OSISnum8[3:0],OSISnum9[3:0],OSISnum10[3:0],OSISnum11[3:0],OSISnum12[3:0],OSISnum13[3:0],OSISnum14[3:0],OSISnum15[3:0];
logic [9:0]OSWSnum0[3:0],OSWSnum1[3:0],OSWSnum2[3:0],OSWSnum3[3:0],OSWSnum4[3:0],OSWSnum5[3:0],OSWSnum6[3:0],OSWSnum7[3:0],OSWSnum8[3:0],OSWSnum9[3:0],OSWSnum10[3:0],OSWSnum11[3:0],OSWSnum12[3:0],OSWSnum13[3:0],OSWSnum14[3:0],OSWSnum15[3:0];
always_ff@( posedge clk or posedge rst ) begin // 第0個OS的兩個num
    if(rst)begin
        OSISnum0[0] <= 0; OSISnum0[1] <= 0; OSISnum0[2] <= 0; OSISnum0[3] <= 0;
        OSWSnum0[0] <= 0; OSWSnum0[1] <= 0; OSWSnum0[2] <= 0; OSWSnum0[3] <= 0;
    end else begin
        if(state0)begin
            if(OS_counter0 == 0)begin
                OSISnum0[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(1)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum0[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter0 == 1)begin
                OSISnum0[0] <= OSISnum0[0] + 1;                OSWSnum0[0] <= OSWSnum0[0] + 1;                OSISnum0[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(1)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum0[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter0 == 2)begin
                OSISnum0[0] <= OSISnum0[0] + 1;                OSWSnum0[0] <= OSWSnum0[0] + 1;                OSISnum0[1] <= OSISnum0[1] + 1;                OSWSnum0[1] <= OSWSnum0[1] + 1;                OSISnum0[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(1)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum0[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter0 == 3)begin
                OSISnum0[0] <= OSISnum0[0] + 1;                OSWSnum0[0] <= OSWSnum0[0] + 1;                OSISnum0[1] <= OSISnum0[1] + 1;                OSWSnum0[1] <= OSWSnum0[1] + 1;                OSISnum0[2] <= OSISnum0[2] + 1;                OSWSnum0[2] <= OSWSnum0[2] + 1;                OSISnum0[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(1)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum0[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum0[0] <= OSISnum0[0] + 1;                OSWSnum0[0] <= OSWSnum0[0] + 1;
                OSISnum0[1] <= OSISnum0[1] + 1;                OSWSnum0[1] <= OSWSnum0[1] + 1;
                OSISnum0[2] <= OSISnum0[2] + 1;                OSWSnum0[2] <= OSWSnum0[2] + 1;
                OSISnum0[3] <= OSISnum0[3] + 1;                OSWSnum0[3] <= OSWSnum0[3] + 1;
            end
        end else begin
            OSISnum0[0] <= 0; OSISnum0[1] <= 0; OSISnum0[2] <= 0; OSISnum0[3] <= 0;

            OSWSnum0[0] <= 0; OSWSnum0[1] <= 0; OSWSnum0[2] <= 0; OSWSnum0[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第1個OS的兩個num
    if(rst)begin
        OSISnum1[0] <= 0; OSISnum1[1] <= 0; OSISnum1[2] <= 0; OSISnum1[3] <= 0;
        OSWSnum1[0] <= 0; OSWSnum1[1] <= 0; OSWSnum1[2] <= 0; OSWSnum1[3] <= 0;
    end else begin
        if(state1)begin
            if(OS_counter1 == 0)begin
                OSISnum1[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(2)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum1[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter1 == 1)begin
                OSISnum1[0] <= OSISnum1[0] + 1;                OSWSnum1[0] <= OSWSnum1[0] + 1;                OSISnum1[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(2)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum1[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter1 == 2)begin
                OSISnum1[0] <= OSISnum1[0] + 1;                OSWSnum1[0] <= OSWSnum1[0] + 1;                OSISnum1[1] <= OSISnum1[1] + 1;                OSWSnum1[1] <= OSWSnum1[1] + 1;                OSISnum1[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(2)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum1[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter1 == 3)begin
                OSISnum1[0] <= OSISnum1[0] + 1;                OSWSnum1[0] <= OSWSnum1[0] + 1;                OSISnum1[1] <= OSISnum1[1] + 1;                OSWSnum1[1] <= OSWSnum1[1] + 1;                OSISnum1[2] <= OSISnum1[2] + 1;                OSWSnum1[2] <= OSWSnum1[2] + 1;                OSISnum1[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(2)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum1[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum1[0] <= OSISnum1[0] + 1;                OSWSnum1[0] <= OSWSnum1[0] + 1;
                OSISnum1[1] <= OSISnum1[1] + 1;                OSWSnum1[1] <= OSWSnum1[1] + 1;
                OSISnum1[2] <= OSISnum1[2] + 1;                OSWSnum1[2] <= OSWSnum1[2] + 1;
                OSISnum1[3] <= OSISnum1[3] + 1;                OSWSnum1[3] <= OSWSnum1[3] + 1;
            end
        end else begin
            OSISnum1[0] <= 0; OSISnum1[1] <= 0; OSISnum1[2] <= 0; OSISnum1[3] <= 0;

            OSWSnum1[0] <= 0; OSWSnum1[1] <= 0; OSWSnum1[2] <= 0; OSWSnum1[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第2個OS的兩個num
    if(rst)begin
        OSISnum2[0] <= 0; OSISnum2[1] <= 0; OSISnum2[2] <= 0; OSISnum2[3] <= 0;
        OSWSnum2[0] <= 0; OSWSnum2[1] <= 0; OSWSnum2[2] <= 0; OSWSnum2[3] <= 0;
    end else begin
        if(state2)begin
            if(OS_counter2 == 0)begin
                OSISnum2[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(3)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum2[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter2 == 1)begin
                OSISnum2[0] <= OSISnum2[0] + 1;                OSWSnum2[0] <= OSWSnum2[0] + 1;                OSISnum2[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(3)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum2[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter2 == 2)begin
                OSISnum2[0] <= OSISnum2[0] + 1;                OSWSnum2[0] <= OSWSnum2[0] + 1;                OSISnum2[1] <= OSISnum2[1] + 1;                OSWSnum2[1] <= OSWSnum2[1] + 1;                OSISnum2[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(3)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum2[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter2 == 3)begin
                OSISnum2[0] <= OSISnum2[0] + 1;                OSWSnum2[0] <= OSWSnum2[0] + 1;                OSISnum2[1] <= OSISnum2[1] + 1;                OSWSnum2[1] <= OSWSnum2[1] + 1;                OSISnum2[2] <= OSISnum2[2] + 1;                OSWSnum2[2] <= OSWSnum2[2] + 1;                OSISnum2[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(3)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum2[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum2[0] <= OSISnum2[0] + 1;                OSWSnum2[0] <= OSWSnum2[0] + 1;
                OSISnum2[1] <= OSISnum2[1] + 1;                OSWSnum2[1] <= OSWSnum2[1] + 1;
                OSISnum2[2] <= OSISnum2[2] + 1;                OSWSnum2[2] <= OSWSnum2[2] + 1;
                OSISnum2[3] <= OSISnum2[3] + 1;                OSWSnum2[3] <= OSWSnum2[3] + 1;
            end
        end else begin
            OSISnum2[0] <= 0; OSISnum2[1] <= 0; OSISnum2[2] <= 0; OSISnum2[3] <= 0;

            OSWSnum2[0] <= 0; OSWSnum2[1] <= 0; OSWSnum2[2] <= 0; OSWSnum2[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第3個OS的兩個num
    if(rst)begin
        OSISnum3[0] <= 0; OSISnum3[1] <= 0; OSISnum3[2] <= 0; OSISnum3[3] <= 0;
        OSWSnum3[0] <= 0; OSWSnum3[1] <= 0; OSWSnum3[2] <= 0; OSWSnum3[3] <= 0;
    end else begin
        if(state3)begin
            if(OS_counter3 == 0)begin
                OSISnum3[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(4)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum3[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter3 == 1)begin
                OSISnum3[0] <= OSISnum3[0] + 1;                OSWSnum3[0] <= OSWSnum3[0] + 1;                OSISnum3[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(4)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum3[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter3 == 2)begin
                OSISnum3[0] <= OSISnum3[0] + 1;                OSWSnum3[0] <= OSWSnum3[0] + 1;                OSISnum3[1] <= OSISnum3[1] + 1;                OSWSnum3[1] <= OSWSnum3[1] + 1;                OSISnum3[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(4)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum3[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter3 == 3)begin
                OSISnum3[0] <= OSISnum3[0] + 1;                OSWSnum3[0] <= OSWSnum3[0] + 1;                OSISnum3[1] <= OSISnum3[1] + 1;                OSWSnum3[1] <= OSWSnum3[1] + 1;                OSISnum3[2] <= OSISnum3[2] + 1;                OSWSnum3[2] <= OSWSnum3[2] + 1;                OSISnum3[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(4)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum3[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum3[0] <= OSISnum3[0] + 1;                OSWSnum3[0] <= OSWSnum3[0] + 1;
                OSISnum3[1] <= OSISnum3[1] + 1;                OSWSnum3[1] <= OSWSnum3[1] + 1;
                OSISnum3[2] <= OSISnum3[2] + 1;                OSWSnum3[2] <= OSWSnum3[2] + 1;
                OSISnum3[3] <= OSISnum3[3] + 1;                OSWSnum3[3] <= OSWSnum3[3] + 1;
            end
        end else begin
            OSISnum3[0] <= 0; OSISnum3[1] <= 0; OSISnum3[2] <= 0; OSISnum3[3] <= 0;

            OSWSnum3[0] <= 0; OSWSnum3[1] <= 0; OSWSnum3[2] <= 0; OSWSnum3[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第4個OS的兩個num
    if(rst)begin
        OSISnum4[0] <= 0; OSISnum4[1] <= 0; OSISnum4[2] <= 0; OSISnum4[3] <= 0;
        OSWSnum4[0] <= 0; OSWSnum4[1] <= 0; OSWSnum4[2] <= 0; OSWSnum4[3] <= 0;
    end else begin
        if(state4)begin
            if(OS_counter4 == 0)begin
                OSISnum4[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(5)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum4[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter4 == 1)begin
                OSISnum4[0] <= OSISnum4[0] + 1;                OSWSnum4[0] <= OSWSnum4[0] + 1;                OSISnum4[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(5)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum4[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter4 == 2)begin
                OSISnum4[0] <= OSISnum4[0] + 1;                OSWSnum4[0] <= OSWSnum4[0] + 1;                OSISnum4[1] <= OSISnum4[1] + 1;                OSWSnum4[1] <= OSWSnum4[1] + 1;                OSISnum4[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(5)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum4[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter4 == 3)begin
                OSISnum4[0] <= OSISnum4[0] + 1;                OSWSnum4[0] <= OSWSnum4[0] + 1;                OSISnum4[1] <= OSISnum4[1] + 1;                OSWSnum4[1] <= OSWSnum4[1] + 1;                OSISnum4[2] <= OSISnum4[2] + 1;                OSWSnum4[2] <= OSWSnum4[2] + 1;                OSISnum4[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(5)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum4[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum4[0] <= OSISnum4[0] + 1;                OSWSnum4[0] <= OSWSnum4[0] + 1;
                OSISnum4[1] <= OSISnum4[1] + 1;                OSWSnum4[1] <= OSWSnum4[1] + 1;
                OSISnum4[2] <= OSISnum4[2] + 1;                OSWSnum4[2] <= OSWSnum4[2] + 1;
                OSISnum4[3] <= OSISnum4[3] + 1;                OSWSnum4[3] <= OSWSnum4[3] + 1;
            end
        end else begin
            OSISnum4[0] <= 0; OSISnum4[1] <= 0; OSISnum4[2] <= 0; OSISnum4[3] <= 0;

            OSWSnum4[0] <= 0; OSWSnum4[1] <= 0; OSWSnum4[2] <= 0; OSWSnum4[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第5個OS的兩個num
    if(rst)begin
        OSISnum5[0] <= 0; OSISnum5[1] <= 0; OSISnum5[2] <= 0; OSISnum5[3] <= 0;
        OSWSnum5[0] <= 0; OSWSnum5[1] <= 0; OSWSnum5[2] <= 0; OSWSnum5[3] <= 0;
    end else begin
        if(state5)begin
            if(OS_counter5 == 0)begin
                OSISnum5[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(6)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum5[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter5 == 1)begin
                OSISnum5[0] <= OSISnum5[0] + 1;                OSWSnum5[0] <= OSWSnum5[0] + 1;                OSISnum5[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(6)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum5[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter5 == 2)begin
                OSISnum5[0] <= OSISnum5[0] + 1;                OSWSnum5[0] <= OSWSnum5[0] + 1;                OSISnum5[1] <= OSISnum5[1] + 1;                OSWSnum5[1] <= OSWSnum5[1] + 1;                OSISnum5[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(6)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum5[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter5 == 3)begin
                OSISnum5[0] <= OSISnum5[0] + 1;                OSWSnum5[0] <= OSWSnum5[0] + 1;                OSISnum5[1] <= OSISnum5[1] + 1;                OSWSnum5[1] <= OSWSnum5[1] + 1;                OSISnum5[2] <= OSISnum5[2] + 1;                OSWSnum5[2] <= OSWSnum5[2] + 1;                OSISnum5[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(6)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum5[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum5[0] <= OSISnum5[0] + 1;                OSWSnum5[0] <= OSWSnum5[0] + 1;
                OSISnum5[1] <= OSISnum5[1] + 1;                OSWSnum5[1] <= OSWSnum5[1] + 1;
                OSISnum5[2] <= OSISnum5[2] + 1;                OSWSnum5[2] <= OSWSnum5[2] + 1;
                OSISnum5[3] <= OSISnum5[3] + 1;                OSWSnum5[3] <= OSWSnum5[3] + 1;
            end
        end else begin
            OSISnum5[0] <= 0; OSISnum5[1] <= 0; OSISnum5[2] <= 0; OSISnum5[3] <= 0;

            OSWSnum5[0] <= 0; OSWSnum5[1] <= 0; OSWSnum5[2] <= 0; OSWSnum5[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第6個OS的兩個num
    if(rst)begin
        OSISnum6[0] <= 0; OSISnum6[1] <= 0; OSISnum6[2] <= 0; OSISnum6[3] <= 0;
        OSWSnum6[0] <= 0; OSWSnum6[1] <= 0; OSWSnum6[2] <= 0; OSWSnum6[3] <= 0;
    end else begin
        if(state6)begin
            if(OS_counter6 == 0)begin
                OSISnum6[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(7)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum6[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter6 == 1)begin
                OSISnum6[0] <= OSISnum6[0] + 1;                OSWSnum6[0] <= OSWSnum6[0] + 1;                OSISnum6[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(7)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum6[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter6 == 2)begin
                OSISnum6[0] <= OSISnum6[0] + 1;                OSWSnum6[0] <= OSWSnum6[0] + 1;                OSISnum6[1] <= OSISnum6[1] + 1;                OSWSnum6[1] <= OSWSnum6[1] + 1;                OSISnum6[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(7)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum6[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter6 == 3)begin
                OSISnum6[0] <= OSISnum6[0] + 1;                OSWSnum6[0] <= OSWSnum6[0] + 1;                OSISnum6[1] <= OSISnum6[1] + 1;                OSWSnum6[1] <= OSWSnum6[1] + 1;                OSISnum6[2] <= OSISnum6[2] + 1;                OSWSnum6[2] <= OSWSnum6[2] + 1;                OSISnum6[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(7)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum6[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum6[0] <= OSISnum6[0] + 1;                OSWSnum6[0] <= OSWSnum6[0] + 1;
                OSISnum6[1] <= OSISnum6[1] + 1;                OSWSnum6[1] <= OSWSnum6[1] + 1;
                OSISnum6[2] <= OSISnum6[2] + 1;                OSWSnum6[2] <= OSWSnum6[2] + 1;
                OSISnum6[3] <= OSISnum6[3] + 1;                OSWSnum6[3] <= OSWSnum6[3] + 1;
            end
        end else begin
            OSISnum6[0] <= 0; OSISnum6[1] <= 0; OSISnum6[2] <= 0; OSISnum6[3] <= 0;

            OSWSnum6[0] <= 0; OSWSnum6[1] <= 0; OSWSnum6[2] <= 0; OSWSnum6[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第7個OS的兩個num
    if(rst)begin
        OSISnum7[0] <= 0; OSISnum7[1] <= 0; OSISnum7[2] <= 0; OSISnum7[3] <= 0;
        OSWSnum7[0] <= 0; OSWSnum7[1] <= 0; OSWSnum7[2] <= 0; OSWSnum7[3] <= 0;
    end else begin
        if(state7)begin
            if(OS_counter7 == 0)begin
                OSISnum7[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(8)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum7[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter7 == 1)begin
                OSISnum7[0] <= OSISnum7[0] + 1;                OSWSnum7[0] <= OSWSnum7[0] + 1;                OSISnum7[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(8)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum7[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter7 == 2)begin
                OSISnum7[0] <= OSISnum7[0] + 1;                OSWSnum7[0] <= OSWSnum7[0] + 1;                OSISnum7[1] <= OSISnum7[1] + 1;                OSWSnum7[1] <= OSWSnum7[1] + 1;                OSISnum7[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(8)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum7[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter7 == 3)begin
                OSISnum7[0] <= OSISnum7[0] + 1;                OSWSnum7[0] <= OSWSnum7[0] + 1;                OSISnum7[1] <= OSISnum7[1] + 1;                OSWSnum7[1] <= OSWSnum7[1] + 1;                OSISnum7[2] <= OSISnum7[2] + 1;                OSWSnum7[2] <= OSWSnum7[2] + 1;                OSISnum7[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(8)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum7[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum7[0] <= OSISnum7[0] + 1;                OSWSnum7[0] <= OSWSnum7[0] + 1;
                OSISnum7[1] <= OSISnum7[1] + 1;                OSWSnum7[1] <= OSWSnum7[1] + 1;
                OSISnum7[2] <= OSISnum7[2] + 1;                OSWSnum7[2] <= OSWSnum7[2] + 1;
                OSISnum7[3] <= OSISnum7[3] + 1;                OSWSnum7[3] <= OSWSnum7[3] + 1;
            end
        end else begin
            OSISnum7[0] <= 0; OSISnum7[1] <= 0; OSISnum7[2] <= 0; OSISnum7[3] <= 0;

            OSWSnum7[0] <= 0; OSWSnum7[1] <= 0; OSWSnum7[2] <= 0; OSWSnum7[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第8個OS的兩個num
    if(rst)begin
        OSISnum8[0] <= 0; OSISnum8[1] <= 0; OSISnum8[2] <= 0; OSISnum8[3] <= 0;
        OSWSnum8[0] <= 0; OSWSnum8[1] <= 0; OSWSnum8[2] <= 0; OSWSnum8[3] <= 0;
    end else begin
        if(state8)begin
            if(OS_counter8 == 0)begin
                OSISnum8[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(9)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum8[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter8 == 1)begin
                OSISnum8[0] <= OSISnum8[0] + 1;                OSWSnum8[0] <= OSWSnum8[0] + 1;                OSISnum8[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(9)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum8[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter8 == 2)begin
                OSISnum8[0] <= OSISnum8[0] + 1;                OSWSnum8[0] <= OSWSnum8[0] + 1;                OSISnum8[1] <= OSISnum8[1] + 1;                OSWSnum8[1] <= OSWSnum8[1] + 1;                OSISnum8[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(9)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum8[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter8 == 3)begin
                OSISnum8[0] <= OSISnum8[0] + 1;                OSWSnum8[0] <= OSWSnum8[0] + 1;                OSISnum8[1] <= OSISnum8[1] + 1;                OSWSnum8[1] <= OSWSnum8[1] + 1;                OSISnum8[2] <= OSISnum8[2] + 1;                OSWSnum8[2] <= OSWSnum8[2] + 1;                OSISnum8[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(9)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum8[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum8[0] <= OSISnum8[0] + 1;                OSWSnum8[0] <= OSWSnum8[0] + 1;
                OSISnum8[1] <= OSISnum8[1] + 1;                OSWSnum8[1] <= OSWSnum8[1] + 1;
                OSISnum8[2] <= OSISnum8[2] + 1;                OSWSnum8[2] <= OSWSnum8[2] + 1;
                OSISnum8[3] <= OSISnum8[3] + 1;                OSWSnum8[3] <= OSWSnum8[3] + 1;
            end
        end else begin
            OSISnum8[0] <= 0; OSISnum8[1] <= 0; OSISnum8[2] <= 0; OSISnum8[3] <= 0;

            OSWSnum8[0] <= 0; OSWSnum8[1] <= 0; OSWSnum8[2] <= 0; OSWSnum8[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第9個OS的兩個num
    if(rst)begin
        OSISnum9[0] <= 0; OSISnum9[1] <= 0; OSISnum9[2] <= 0; OSISnum9[3] <= 0;
        OSWSnum9[0] <= 0; OSWSnum9[1] <= 0; OSWSnum9[2] <= 0; OSWSnum9[3] <= 0;
    end else begin
        if(state9)begin
            if(OS_counter9 == 0)begin
                OSISnum9[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(10)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum9[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter9 == 1)begin
                OSISnum9[0] <= OSISnum9[0] + 1;                OSWSnum9[0] <= OSWSnum9[0] + 1;                OSISnum9[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(10)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum9[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter9 == 2)begin
                OSISnum9[0] <= OSISnum9[0] + 1;                OSWSnum9[0] <= OSWSnum9[0] + 1;                OSISnum9[1] <= OSISnum9[1] + 1;                OSWSnum9[1] <= OSWSnum9[1] + 1;                OSISnum9[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(10)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum9[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter9 == 3)begin
                OSISnum9[0] <= OSISnum9[0] + 1;                OSWSnum9[0] <= OSWSnum9[0] + 1;                OSISnum9[1] <= OSISnum9[1] + 1;                OSWSnum9[1] <= OSWSnum9[1] + 1;                OSISnum9[2] <= OSISnum9[2] + 1;                OSWSnum9[2] <= OSWSnum9[2] + 1;                OSISnum9[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(10)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum9[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum9[0] <= OSISnum9[0] + 1;                OSWSnum9[0] <= OSWSnum9[0] + 1;
                OSISnum9[1] <= OSISnum9[1] + 1;                OSWSnum9[1] <= OSWSnum9[1] + 1;
                OSISnum9[2] <= OSISnum9[2] + 1;                OSWSnum9[2] <= OSWSnum9[2] + 1;
                OSISnum9[3] <= OSISnum9[3] + 1;                OSWSnum9[3] <= OSWSnum9[3] + 1;
            end
        end else begin
            OSISnum9[0] <= 0; OSISnum9[1] <= 0; OSISnum9[2] <= 0; OSISnum9[3] <= 0;

            OSWSnum9[0] <= 0; OSWSnum9[1] <= 0; OSWSnum9[2] <= 0; OSWSnum9[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第10個OS的兩個num
    if(rst)begin
        OSISnum10[0] <= 0; OSISnum10[1] <= 0; OSISnum10[2] <= 0; OSISnum10[3] <= 0;
        OSWSnum10[0] <= 0; OSWSnum10[1] <= 0; OSWSnum10[2] <= 0; OSWSnum10[3] <= 0;
    end else begin
        if(state10)begin
            if(OS_counter10 == 0)begin
                OSISnum10[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(11)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum10[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter10 == 1)begin
                OSISnum10[0] <= OSISnum10[0] + 1;                OSWSnum10[0] <= OSWSnum10[0] + 1;                OSISnum10[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(11)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum10[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter10 == 2)begin
                OSISnum10[0] <= OSISnum10[0] + 1;                OSWSnum10[0] <= OSWSnum10[0] + 1;                OSISnum10[1] <= OSISnum10[1] + 1;                OSWSnum10[1] <= OSWSnum10[1] + 1;                OSISnum10[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(11)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum10[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter10 == 3)begin
                OSISnum10[0] <= OSISnum10[0] + 1;                OSWSnum10[0] <= OSWSnum10[0] + 1;                OSISnum10[1] <= OSISnum10[1] + 1;                OSWSnum10[1] <= OSWSnum10[1] + 1;                OSISnum10[2] <= OSISnum10[2] + 1;                OSWSnum10[2] <= OSWSnum10[2] + 1;                OSISnum10[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(11)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum10[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum10[0] <= OSISnum10[0] + 1;                OSWSnum10[0] <= OSWSnum10[0] + 1;
                OSISnum10[1] <= OSISnum10[1] + 1;                OSWSnum10[1] <= OSWSnum10[1] + 1;
                OSISnum10[2] <= OSISnum10[2] + 1;                OSWSnum10[2] <= OSWSnum10[2] + 1;
                OSISnum10[3] <= OSISnum10[3] + 1;                OSWSnum10[3] <= OSWSnum10[3] + 1;
            end
        end else begin
            OSISnum10[0] <= 0; OSISnum10[1] <= 0; OSISnum10[2] <= 0; OSISnum10[3] <= 0;

            OSWSnum10[0] <= 0; OSWSnum10[1] <= 0; OSWSnum10[2] <= 0; OSWSnum10[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第11個OS的兩個num
    if(rst)begin
        OSISnum11[0] <= 0; OSISnum11[1] <= 0; OSISnum11[2] <= 0; OSISnum11[3] <= 0;
        OSWSnum11[0] <= 0; OSWSnum11[1] <= 0; OSWSnum11[2] <= 0; OSWSnum11[3] <= 0;
    end else begin
        if(state11)begin
            if(OS_counter11 == 0)begin
                OSISnum11[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(12)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum11[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter11 == 1)begin
                OSISnum11[0] <= OSISnum11[0] + 1;                OSWSnum11[0] <= OSWSnum11[0] + 1;                OSISnum11[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(12)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum11[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter11 == 2)begin
                OSISnum11[0] <= OSISnum11[0] + 1;                OSWSnum11[0] <= OSWSnum11[0] + 1;                OSISnum11[1] <= OSISnum11[1] + 1;                OSWSnum11[1] <= OSWSnum11[1] + 1;                OSISnum11[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(12)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum11[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter11 == 3)begin
                OSISnum11[0] <= OSISnum11[0] + 1;                OSWSnum11[0] <= OSWSnum11[0] + 1;                OSISnum11[1] <= OSISnum11[1] + 1;                OSWSnum11[1] <= OSWSnum11[1] + 1;                OSISnum11[2] <= OSISnum11[2] + 1;                OSWSnum11[2] <= OSWSnum11[2] + 1;                OSISnum11[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(12)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum11[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum11[0] <= OSISnum11[0] + 1;                OSWSnum11[0] <= OSWSnum11[0] + 1;
                OSISnum11[1] <= OSISnum11[1] + 1;                OSWSnum11[1] <= OSWSnum11[1] + 1;
                OSISnum11[2] <= OSISnum11[2] + 1;                OSWSnum11[2] <= OSWSnum11[2] + 1;
                OSISnum11[3] <= OSISnum11[3] + 1;                OSWSnum11[3] <= OSWSnum11[3] + 1;
            end
        end else begin
            OSISnum11[0] <= 0; OSISnum11[1] <= 0; OSISnum11[2] <= 0; OSISnum11[3] <= 0;

            OSWSnum11[0] <= 0; OSWSnum11[1] <= 0; OSWSnum11[2] <= 0; OSWSnum11[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第12個OS的兩個num
    if(rst)begin
        OSISnum12[0] <= 0; OSISnum12[1] <= 0; OSISnum12[2] <= 0; OSISnum12[3] <= 0;
        OSWSnum12[0] <= 0; OSWSnum12[1] <= 0; OSWSnum12[2] <= 0; OSWSnum12[3] <= 0;
    end else begin
        if(state12)begin
            if(OS_counter12 == 0)begin
                OSISnum12[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(13)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum12[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter12 == 1)begin
                OSISnum12[0] <= OSISnum12[0] + 1;                OSWSnum12[0] <= OSWSnum12[0] + 1;                OSISnum12[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(13)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum12[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter12 == 2)begin
                OSISnum12[0] <= OSISnum12[0] + 1;                OSWSnum12[0] <= OSWSnum12[0] + 1;                OSISnum12[1] <= OSISnum12[1] + 1;                OSWSnum12[1] <= OSWSnum12[1] + 1;                OSISnum12[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(13)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum12[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter12 == 3)begin
                OSISnum12[0] <= OSISnum12[0] + 1;                OSWSnum12[0] <= OSWSnum12[0] + 1;                OSISnum12[1] <= OSISnum12[1] + 1;                OSWSnum12[1] <= OSWSnum12[1] + 1;                OSISnum12[2] <= OSISnum12[2] + 1;                OSWSnum12[2] <= OSWSnum12[2] + 1;                OSISnum12[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(13)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum12[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum12[0] <= OSISnum12[0] + 1;                OSWSnum12[0] <= OSWSnum12[0] + 1;
                OSISnum12[1] <= OSISnum12[1] + 1;                OSWSnum12[1] <= OSWSnum12[1] + 1;
                OSISnum12[2] <= OSISnum12[2] + 1;                OSWSnum12[2] <= OSWSnum12[2] + 1;
                OSISnum12[3] <= OSISnum12[3] + 1;                OSWSnum12[3] <= OSWSnum12[3] + 1;
            end
        end else begin
            OSISnum12[0] <= 0; OSISnum12[1] <= 0; OSISnum12[2] <= 0; OSISnum12[3] <= 0;

            OSWSnum12[0] <= 0; OSWSnum12[1] <= 0; OSWSnum12[2] <= 0; OSWSnum12[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第13個OS的兩個num
    if(rst)begin
        OSISnum13[0] <= 0; OSISnum13[1] <= 0; OSISnum13[2] <= 0; OSISnum13[3] <= 0;
        OSWSnum13[0] <= 0; OSWSnum13[1] <= 0; OSWSnum13[2] <= 0; OSWSnum13[3] <= 0;
    end else begin
        if(state13)begin
            if(OS_counter13 == 0)begin
                OSISnum13[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(14)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum13[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter13 == 1)begin
                OSISnum13[0] <= OSISnum13[0] + 1;                OSWSnum13[0] <= OSWSnum13[0] + 1;                OSISnum13[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(14)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum13[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter13 == 2)begin
                OSISnum13[0] <= OSISnum13[0] + 1;                OSWSnum13[0] <= OSWSnum13[0] + 1;                OSISnum13[1] <= OSISnum13[1] + 1;                OSWSnum13[1] <= OSWSnum13[1] + 1;                OSISnum13[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(14)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum13[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter13 == 3)begin
                OSISnum13[0] <= OSISnum13[0] + 1;                OSWSnum13[0] <= OSWSnum13[0] + 1;                OSISnum13[1] <= OSISnum13[1] + 1;                OSWSnum13[1] <= OSWSnum13[1] + 1;                OSISnum13[2] <= OSISnum13[2] + 1;                OSWSnum13[2] <= OSWSnum13[2] + 1;                OSISnum13[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(14)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum13[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum13[0] <= OSISnum13[0] + 1;                OSWSnum13[0] <= OSWSnum13[0] + 1;
                OSISnum13[1] <= OSISnum13[1] + 1;                OSWSnum13[1] <= OSWSnum13[1] + 1;
                OSISnum13[2] <= OSISnum13[2] + 1;                OSWSnum13[2] <= OSWSnum13[2] + 1;
                OSISnum13[3] <= OSISnum13[3] + 1;                OSWSnum13[3] <= OSWSnum13[3] + 1;
            end
        end else begin
            OSISnum13[0] <= 0; OSISnum13[1] <= 0; OSISnum13[2] <= 0; OSISnum13[3] <= 0;

            OSWSnum13[0] <= 0; OSWSnum13[1] <= 0; OSWSnum13[2] <= 0; OSWSnum13[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第14個OS的兩個num
    if(rst)begin
        OSISnum14[0] <= 0; OSISnum14[1] <= 0; OSISnum14[2] <= 0; OSISnum14[3] <= 0;
        OSWSnum14[0] <= 0; OSWSnum14[1] <= 0; OSWSnum14[2] <= 0; OSWSnum14[3] <= 0;
    end else begin
        if(state14)begin
            if(OS_counter14 == 0)begin
                OSISnum14[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(15)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum14[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter14 == 1)begin
                OSISnum14[0] <= OSISnum14[0] + 1;                OSWSnum14[0] <= OSWSnum14[0] + 1;                OSISnum14[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(15)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum14[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter14 == 2)begin
                OSISnum14[0] <= OSISnum14[0] + 1;                OSWSnum14[0] <= OSWSnum14[0] + 1;                OSISnum14[1] <= OSISnum14[1] + 1;                OSWSnum14[1] <= OSWSnum14[1] + 1;                OSISnum14[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(15)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum14[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter14 == 3)begin
                OSISnum14[0] <= OSISnum14[0] + 1;                OSWSnum14[0] <= OSWSnum14[0] + 1;                OSISnum14[1] <= OSISnum14[1] + 1;                OSWSnum14[1] <= OSWSnum14[1] + 1;                OSISnum14[2] <= OSISnum14[2] + 1;                OSWSnum14[2] <= OSWSnum14[2] + 1;                OSISnum14[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(15)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum14[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum14[0] <= OSISnum14[0] + 1;                OSWSnum14[0] <= OSWSnum14[0] + 1;
                OSISnum14[1] <= OSISnum14[1] + 1;                OSWSnum14[1] <= OSWSnum14[1] + 1;
                OSISnum14[2] <= OSISnum14[2] + 1;                OSWSnum14[2] <= OSWSnum14[2] + 1;
                OSISnum14[3] <= OSISnum14[3] + 1;                OSWSnum14[3] <= OSWSnum14[3] + 1;
            end
        end else begin
            OSISnum14[0] <= 0; OSISnum14[1] <= 0; OSISnum14[2] <= 0; OSISnum14[3] <= 0;

            OSWSnum14[0] <= 0; OSWSnum14[1] <= 0; OSWSnum14[2] <= 0; OSWSnum14[3] <= 0;
        end
    end
end

always_ff@( posedge clk or posedge rst ) begin // 第15個OS的兩個num
    if(rst)begin
        OSISnum15[0] <= 0; OSISnum15[1] <= 0; OSISnum15[2] <= 0; OSISnum15[3] <= 0;
        OSWSnum15[0] <= 0; OSWSnum15[1] <= 0; OSWSnum15[2] <= 0; OSWSnum15[3] <= 0;
    end else begin
        if(state15)begin
            if(OS_counter15 == 0)begin
                OSISnum15[0] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(16)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);
                OSWSnum15[0] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);

            end else if(OS_counter15 == 1)begin
                OSISnum15[0] <= OSISnum15[0] + 1;                OSWSnum15[0] <= OSWSnum15[0] + 1;                OSISnum15[1] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(16)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 1*kernelsize*kernelsize;                OSWSnum15[1] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 1*kernelsize*kernelsize;
            end else if(OS_counter15 == 2)begin
                OSISnum15[0] <= OSISnum15[0] + 1;                OSWSnum15[0] <= OSWSnum15[0] + 1;                OSISnum15[1] <= OSISnum15[1] + 1;                OSWSnum15[1] <= OSWSnum15[1] + 1;                OSISnum15[2] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(16)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 2*kernelsize*kernelsize;                OSWSnum15[2] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 2*kernelsize*kernelsize;
            end else if(OS_counter15 == 3)begin
                OSISnum15[0] <= OSISnum15[0] + 1;                OSWSnum15[0] <= OSWSnum15[0] + 1;                OSISnum15[1] <= OSISnum15[1] + 1;                OSWSnum15[1] <= OSWSnum15[1] + 1;                OSISnum15[2] <= OSISnum15[2] + 1;                OSWSnum15[2] <= OSWSnum15[2] + 1;                OSISnum15[3] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*(16)/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + 3*kernelsize*kernelsize;                OSWSnum15[3] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + 3*kernelsize*kernelsize;
            end else begin
                OSISnum15[0] <= OSISnum15[0] + 1;                OSWSnum15[0] <= OSWSnum15[0] + 1;
                OSISnum15[1] <= OSISnum15[1] + 1;                OSWSnum15[1] <= OSWSnum15[1] + 1;
                OSISnum15[2] <= OSISnum15[2] + 1;                OSWSnum15[2] <= OSWSnum15[2] + 1;
                OSISnum15[3] <= OSISnum15[3] + 1;                OSWSnum15[3] <= OSWSnum15[3] + 1;
            end
        end else begin
            OSISnum15[0] <= 0; OSISnum15[1] <= 0; OSISnum15[2] <= 0; OSISnum15[3] <= 0;

            OSWSnum15[0] <= 0; OSWSnum15[1] <= 0; OSWSnum15[2] <= 0; OSWSnum15[3] <= 0;
        end
    end
end

