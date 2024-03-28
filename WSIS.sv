logic [10:0]WSIS0[3:0],WSIS1[3:0],WSIS2[3:0],WSIS3[3:0],WSIS4[3:0],WSIS5[3:0],WSIS6[3:0],WSIS7[3:0],WSIS8[3:0],WSIS9[3:0],WSIS10[3:0],WSIS11[3:0],WSIS12[3:0],WSIS13[3:0],WSIS14[3:0],WSIS15[3:0];
always_ff@( posedge clk or posedge rst ) begin // WS 第0個開始的state
    if(rst)begin
        WSISnum0[0] <= 0;        WSISnum0[1] <= 0;        WSISnum0[2] <= 0;        WSISnum0[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[0] <= WSISnum0[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[1] <= WSISnum0[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[2] <= WSISnum0[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[0] <= WSISnum0[0] + 1; 
                        WSISnum0[1] <= WSISnum0[1] + 1; 
                        WSISnum0[2] <= WSISnum0[2] + 1; 
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[0] <= WSISnum0[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[2] <= WSISnum0[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[0] <= WSISnum0[0] + 1; 
                        WSISnum0[2] <= WSISnum0[2] + 1; 
                    end
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            3:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[0] <= WSISnum0[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[0] <= WSISnum0[0] + 1; 
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                end
            end
            default:begin
                        WSISnum0[0] <= WSISnum0[0]
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[0] <= WSISnum0[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[1] <= WSISnum0[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[2] <= WSISnum0[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[0] <= WSISnum0[0] + 1; 
                        WSISnum0[1] <= WSISnum0[1] + 1; 
                        WSISnum0[2] <= WSISnum0[2] + 1; 
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[1] <= WSISnum0[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[1] <= WSISnum0[1] + 1; 
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                end
            end
            3:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[2] <= WSISnum0[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[2] <= WSISnum0[2] + 1; 
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            4:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                end
            end
            5:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            6:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            7:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            default:begin
                        WSISnum0[0] <= WSISnum0[0]
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[0] <= WSISnum0[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[1] <= WSISnum0[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[2] <= WSISnum0[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[0] <= WSISnum0[0] + 1; 
                        WSISnum0[1] <= WSISnum0[1] + 1; 
                        WSISnum0[2] <= WSISnum0[2] + 1; 
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[1] <= WSISnum0[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[1] <= WSISnum0[1] + 1; 
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                end
            end
            3:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[0] <= WSISnum0[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[0] <= WSISnum0[0] + 1; 
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                end
            end
            4:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[1] <= WSISnum0[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[1] <= WSISnum0[1] + 1; 
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            5:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[2] <= WSISnum0[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[2] <= WSISnum0[2] + 1; 
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            6:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum0[3] <= WSISnum0[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum0[3] <= WSISnum0[3] + 1; 
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                end
            end
            7:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            8:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            9:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            10:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            11:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            12:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            13:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            14:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            15:begin
                if(OS_counter0 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;

                end else begin
                    if((OS_counter0 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum0[0] <= WSISnum-1[4] + 3;
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
                end
            end
            default:begin
                        WSISnum0[0] <= WSISnum0[0]
                        WSISnum0[1] <= WSISnum0[0] + 3;
                        WSISnum0[2] <= WSISnum0[1] + 3;
                        WSISnum0[3] <= WSISnum0[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第1個開始的state
    if(rst)begin
        WSISnum1[0] <= 0;        WSISnum1[1] <= 0;        WSISnum1[2] <= 0;        WSISnum1[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[1] <= WSISnum1[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[2] <= WSISnum1[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[3] <= WSISnum1[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[1] <= WSISnum1[1] + 1; 
                        WSISnum1[2] <= WSISnum1[2] + 1; 
                        WSISnum1[3] <= WSISnum1[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[2] <= WSISnum1[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[2] <= WSISnum1[2] + 1; 
                    end
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            3:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[3] <= WSISnum1[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[3] <= WSISnum1[3] + 1; 
                    end
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                end
            end
            default:begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[1] <= WSISnum1[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[2] <= WSISnum1[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[3] <= WSISnum1[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[1] <= WSISnum1[1] + 1; 
                        WSISnum1[2] <= WSISnum1[2] + 1; 
                        WSISnum1[3] <= WSISnum1[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[2] <= WSISnum1[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[2] <= WSISnum1[2] + 1; 
                    end
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            3:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[3] <= WSISnum1[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[3] <= WSISnum1[3] + 1; 
                    end
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                end
            end
            default:begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[1] <= WSISnum1[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[2] <= WSISnum1[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[3] <= WSISnum1[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[1] <= WSISnum1[1] + 1; 
                        WSISnum1[2] <= WSISnum1[2] + 1; 
                        WSISnum1[3] <= WSISnum1[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[0] <= WSISnum1[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum1[2] <= WSISnum1[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[0] <= WSISnum1[0] + 1; 
                        WSISnum1[2] <= WSISnum1[2] + 1; 
                    end
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            3:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[1] <= WSISnum1[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[1] <= WSISnum1[1] + 1; 
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            4:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[2] <= WSISnum1[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[2] <= WSISnum1[2] + 1; 
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            5:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum1[3] <= WSISnum1[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum1[3] <= WSISnum1[3] + 1; 
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                end
            end
            6:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            7:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            8:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            9:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            10:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            11:begin
                if(OS_counter1 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;

                end else begin
                    if((OS_counter1 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
                end
            end
            default:begin
                        WSISnum1[0] <= WSISnum0[4] + 3;
                        WSISnum1[1] <= WSISnum1[0] + 3;
                        WSISnum1[2] <= WSISnum1[1] + 3;
                        WSISnum1[3] <= WSISnum1[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第2個開始的state
    if(rst)begin
        WSISnum2[0] <= 0;        WSISnum2[1] <= 0;        WSISnum2[2] <= 0;        WSISnum2[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[0] <= WSISnum2[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[1] <= WSISnum2[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[2] <= WSISnum2[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[0] <= WSISnum2[0] + 1; 
                        WSISnum2[1] <= WSISnum2[1] + 1; 
                        WSISnum2[2] <= WSISnum2[2] + 1; 
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[0] <= WSISnum2[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[2] <= WSISnum2[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[0] <= WSISnum2[0] + 1; 
                        WSISnum2[2] <= WSISnum2[2] + 1; 
                    end
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            3:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[0] <= WSISnum2[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[0] <= WSISnum2[0] + 1; 
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                end
            end
            default:begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[0] <= WSISnum2[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[1] <= WSISnum2[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[2] <= WSISnum2[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[0] <= WSISnum2[0] + 1; 
                        WSISnum2[1] <= WSISnum2[1] + 1; 
                        WSISnum2[2] <= WSISnum2[2] + 1; 
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[1] <= WSISnum2[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[1] <= WSISnum2[1] + 1; 
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                end
            end
            3:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[2] <= WSISnum2[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[2] <= WSISnum2[2] + 1; 
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            4:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                end
            end
            5:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            6:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            7:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            default:begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[0] <= WSISnum2[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[1] <= WSISnum2[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[2] <= WSISnum2[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[0] <= WSISnum2[0] + 1; 
                        WSISnum2[1] <= WSISnum2[1] + 1; 
                        WSISnum2[2] <= WSISnum2[2] + 1; 
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[1] <= WSISnum2[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[1] <= WSISnum2[1] + 1; 
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                end
            end
            3:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[2] <= WSISnum2[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[2] <= WSISnum2[2] + 1; 
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            4:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum2[3] <= WSISnum2[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum2[3] <= WSISnum2[3] + 1; 
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                end
            end
            5:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            6:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            7:begin
                if(OS_counter2 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;

                end else begin
                    if((OS_counter2 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
                end
            end
            default:begin
                        WSISnum2[0] <= WSISnum1[4] + 3;
                        WSISnum2[1] <= WSISnum2[0] + 3;
                        WSISnum2[2] <= WSISnum2[1] + 3;
                        WSISnum2[3] <= WSISnum2[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第3個開始的state
    if(rst)begin
        WSISnum3[0] <= 0;        WSISnum3[1] <= 0;        WSISnum3[2] <= 0;        WSISnum3[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[1] <= WSISnum3[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[2] <= WSISnum3[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[3] <= WSISnum3[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[1] <= WSISnum3[1] + 1; 
                        WSISnum3[2] <= WSISnum3[2] + 1; 
                        WSISnum3[3] <= WSISnum3[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[3] <= WSISnum3[2] + 3;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[2] <= WSISnum3[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[2] <= WSISnum3[2] + 1; 
                    end
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[3] <= WSISnum3[2] + 3;
                end
            end
            3:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                        WSISnum3[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[3] <= WSISnum3[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[3] <= WSISnum3[3] + 1; 
                    end
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                end
            end
            default:begin
                        WSISnum3[0] <= WSISnum2[4] + 3;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                        WSISnum3[3] <= WSISnum3[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[1] <= WSISnum3[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[2] <= WSISnum3[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[3] <= WSISnum3[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[1] <= WSISnum3[1] + 1; 
                        WSISnum3[2] <= WSISnum3[2] + 1; 
                        WSISnum3[3] <= WSISnum3[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[3] <= WSISnum3[2] + 3;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[2] <= WSISnum3[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[2] <= WSISnum3[2] + 1; 
                    end
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[3] <= WSISnum3[2] + 3;
                end
            end
            3:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                        WSISnum3[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[3] <= WSISnum3[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[3] <= WSISnum3[3] + 1; 
                    end
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                end
            end
            default:begin
                        WSISnum3[0] <= WSISnum2[4] + 3;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                        WSISnum3[3] <= WSISnum3[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[1] <= WSISnum3[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[2] <= WSISnum3[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[3] <= WSISnum3[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[1] <= WSISnum3[1] + 1; 
                        WSISnum3[2] <= WSISnum3[2] + 1; 
                        WSISnum3[3] <= WSISnum3[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[3] <= WSISnum3[2] + 3;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[2] <= WSISnum3[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[2] <= WSISnum3[2] + 1; 
                    end
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[3] <= WSISnum3[2] + 3;
                end
            end
            3:begin
                if(OS_counter3 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum3[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                        WSISnum3[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter3 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum3[0] <= WSISnum3[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum3[3] <= WSISnum3[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum3[0] <= WSISnum3[0] + 1; 
                        WSISnum3[3] <= WSISnum3[3] + 1; 
                    end
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                end
            end
            default:begin
                        WSISnum3[0] <= WSISnum2[4] + 3;
                        WSISnum3[1] <= WSISnum3[0] + 3;
                        WSISnum3[2] <= WSISnum3[1] + 3;
                        WSISnum3[3] <= WSISnum3[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第4個開始的state
    if(rst)begin
        WSISnum4[0] <= 0;        WSISnum4[1] <= 0;        WSISnum4[2] <= 0;        WSISnum4[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[0] <= WSISnum4[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[1] <= WSISnum4[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[2] <= WSISnum4[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[0] <= WSISnum4[0] + 1; 
                        WSISnum4[1] <= WSISnum4[1] + 1; 
                        WSISnum4[2] <= WSISnum4[2] + 1; 
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[0] <= WSISnum4[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[2] <= WSISnum4[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[0] <= WSISnum4[0] + 1; 
                        WSISnum4[2] <= WSISnum4[2] + 1; 
                    end
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            3:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[0] <= WSISnum4[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[0] <= WSISnum4[0] + 1; 
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                end
            end
            default:begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[0] <= WSISnum4[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[1] <= WSISnum4[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[2] <= WSISnum4[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[0] <= WSISnum4[0] + 1; 
                        WSISnum4[1] <= WSISnum4[1] + 1; 
                        WSISnum4[2] <= WSISnum4[2] + 1; 
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[1] <= WSISnum4[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[1] <= WSISnum4[1] + 1; 
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                end
            end
            3:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[2] <= WSISnum4[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[2] <= WSISnum4[2] + 1; 
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            4:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                end
            end
            5:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            6:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            7:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            default:begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[0] <= WSISnum4[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[1] <= WSISnum4[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[2] <= WSISnum4[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[0] <= WSISnum4[0] + 1; 
                        WSISnum4[1] <= WSISnum4[1] + 1; 
                        WSISnum4[2] <= WSISnum4[2] + 1; 
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[1] <= WSISnum4[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[1] <= WSISnum4[1] + 1; 
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                end
            end
            3:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[0] <= WSISnum4[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[0] <= WSISnum4[0] + 1; 
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                end
            end
            4:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[1] <= WSISnum4[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[1] <= WSISnum4[1] + 1; 
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            5:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[2] <= WSISnum4[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[2] <= WSISnum4[2] + 1; 
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            6:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum4[3] <= WSISnum4[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum4[3] <= WSISnum4[3] + 1; 
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                end
            end
            7:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            8:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            9:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            10:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            11:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            12:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            13:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            14:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            15:begin
                if(OS_counter4 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;

                end else begin
                    if((OS_counter4 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
                end
            end
            default:begin
                        WSISnum4[0] <= WSISnum3[4] + 3;
                        WSISnum4[1] <= WSISnum4[0] + 3;
                        WSISnum4[2] <= WSISnum4[1] + 3;
                        WSISnum4[3] <= WSISnum4[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第5個開始的state
    if(rst)begin
        WSISnum5[0] <= 0;        WSISnum5[1] <= 0;        WSISnum5[2] <= 0;        WSISnum5[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[1] <= WSISnum5[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[2] <= WSISnum5[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[3] <= WSISnum5[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[1] <= WSISnum5[1] + 1; 
                        WSISnum5[2] <= WSISnum5[2] + 1; 
                        WSISnum5[3] <= WSISnum5[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[2] <= WSISnum5[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[2] <= WSISnum5[2] + 1; 
                    end
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            3:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[3] <= WSISnum5[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[3] <= WSISnum5[3] + 1; 
                    end
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                end
            end
            default:begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[1] <= WSISnum5[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[2] <= WSISnum5[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[3] <= WSISnum5[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[1] <= WSISnum5[1] + 1; 
                        WSISnum5[2] <= WSISnum5[2] + 1; 
                        WSISnum5[3] <= WSISnum5[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[2] <= WSISnum5[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[2] <= WSISnum5[2] + 1; 
                    end
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            3:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[3] <= WSISnum5[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[3] <= WSISnum5[3] + 1; 
                    end
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                end
            end
            default:begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[1] <= WSISnum5[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[2] <= WSISnum5[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[3] <= WSISnum5[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[1] <= WSISnum5[1] + 1; 
                        WSISnum5[2] <= WSISnum5[2] + 1; 
                        WSISnum5[3] <= WSISnum5[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[0] <= WSISnum5[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum5[2] <= WSISnum5[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[0] <= WSISnum5[0] + 1; 
                        WSISnum5[2] <= WSISnum5[2] + 1; 
                    end
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            3:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[1] <= WSISnum5[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[1] <= WSISnum5[1] + 1; 
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            4:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[2] <= WSISnum5[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[2] <= WSISnum5[2] + 1; 
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            5:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum5[3] <= WSISnum5[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum5[3] <= WSISnum5[3] + 1; 
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                end
            end
            6:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            7:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            8:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            9:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            10:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            11:begin
                if(OS_counter5 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;

                end else begin
                    if((OS_counter5 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
                end
            end
            default:begin
                        WSISnum5[0] <= WSISnum4[4] + 3;
                        WSISnum5[1] <= WSISnum5[0] + 3;
                        WSISnum5[2] <= WSISnum5[1] + 3;
                        WSISnum5[3] <= WSISnum5[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第6個開始的state
    if(rst)begin
        WSISnum6[0] <= 0;        WSISnum6[1] <= 0;        WSISnum6[2] <= 0;        WSISnum6[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[0] <= WSISnum6[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[1] <= WSISnum6[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[2] <= WSISnum6[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[0] <= WSISnum6[0] + 1; 
                        WSISnum6[1] <= WSISnum6[1] + 1; 
                        WSISnum6[2] <= WSISnum6[2] + 1; 
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[0] <= WSISnum6[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[2] <= WSISnum6[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[0] <= WSISnum6[0] + 1; 
                        WSISnum6[2] <= WSISnum6[2] + 1; 
                    end
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            3:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[0] <= WSISnum6[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[0] <= WSISnum6[0] + 1; 
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                end
            end
            default:begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[0] <= WSISnum6[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[1] <= WSISnum6[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[2] <= WSISnum6[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[0] <= WSISnum6[0] + 1; 
                        WSISnum6[1] <= WSISnum6[1] + 1; 
                        WSISnum6[2] <= WSISnum6[2] + 1; 
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[1] <= WSISnum6[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[1] <= WSISnum6[1] + 1; 
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                end
            end
            3:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[2] <= WSISnum6[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[2] <= WSISnum6[2] + 1; 
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            4:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                end
            end
            5:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            6:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            7:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            default:begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[0] <= WSISnum6[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[1] <= WSISnum6[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[2] <= WSISnum6[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[0] <= WSISnum6[0] + 1; 
                        WSISnum6[1] <= WSISnum6[1] + 1; 
                        WSISnum6[2] <= WSISnum6[2] + 1; 
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[1] <= WSISnum6[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[1] <= WSISnum6[1] + 1; 
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                end
            end
            3:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[2] <= WSISnum6[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[2] <= WSISnum6[2] + 1; 
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            4:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum6[3] <= WSISnum6[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum6[3] <= WSISnum6[3] + 1; 
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                end
            end
            5:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            6:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            7:begin
                if(OS_counter6 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;

                end else begin
                    if((OS_counter6 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
                end
            end
            default:begin
                        WSISnum6[0] <= WSISnum5[4] + 3;
                        WSISnum6[1] <= WSISnum6[0] + 3;
                        WSISnum6[2] <= WSISnum6[1] + 3;
                        WSISnum6[3] <= WSISnum6[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第7個開始的state
    if(rst)begin
        WSISnum7[0] <= 0;        WSISnum7[1] <= 0;        WSISnum7[2] <= 0;        WSISnum7[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[1] <= WSISnum7[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[2] <= WSISnum7[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[3] <= WSISnum7[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[1] <= WSISnum7[1] + 1; 
                        WSISnum7[2] <= WSISnum7[2] + 1; 
                        WSISnum7[3] <= WSISnum7[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[3] <= WSISnum7[2] + 3;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[2] <= WSISnum7[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[2] <= WSISnum7[2] + 1; 
                    end
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[3] <= WSISnum7[2] + 3;
                end
            end
            3:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                        WSISnum7[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[3] <= WSISnum7[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[3] <= WSISnum7[3] + 1; 
                    end
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                end
            end
            default:begin
                        WSISnum7[0] <= WSISnum6[4] + 3;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                        WSISnum7[3] <= WSISnum7[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[1] <= WSISnum7[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[2] <= WSISnum7[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[3] <= WSISnum7[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[1] <= WSISnum7[1] + 1; 
                        WSISnum7[2] <= WSISnum7[2] + 1; 
                        WSISnum7[3] <= WSISnum7[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[3] <= WSISnum7[2] + 3;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[2] <= WSISnum7[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[2] <= WSISnum7[2] + 1; 
                    end
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[3] <= WSISnum7[2] + 3;
                end
            end
            3:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                        WSISnum7[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[3] <= WSISnum7[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[3] <= WSISnum7[3] + 1; 
                    end
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                end
            end
            default:begin
                        WSISnum7[0] <= WSISnum6[4] + 3;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                        WSISnum7[3] <= WSISnum7[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[1] <= WSISnum7[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[2] <= WSISnum7[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[3] <= WSISnum7[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[1] <= WSISnum7[1] + 1; 
                        WSISnum7[2] <= WSISnum7[2] + 1; 
                        WSISnum7[3] <= WSISnum7[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[3] <= WSISnum7[2] + 3;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[2] <= WSISnum7[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[2] <= WSISnum7[2] + 1; 
                    end
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[3] <= WSISnum7[2] + 3;
                end
            end
            3:begin
                if(OS_counter7 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum7[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                        WSISnum7[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter7 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum7[0] <= WSISnum7[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum7[3] <= WSISnum7[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum7[0] <= WSISnum7[0] + 1; 
                        WSISnum7[3] <= WSISnum7[3] + 1; 
                    end
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                end
            end
            default:begin
                        WSISnum7[0] <= WSISnum6[4] + 3;
                        WSISnum7[1] <= WSISnum7[0] + 3;
                        WSISnum7[2] <= WSISnum7[1] + 3;
                        WSISnum7[3] <= WSISnum7[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第8個開始的state
    if(rst)begin
        WSISnum8[0] <= 0;        WSISnum8[1] <= 0;        WSISnum8[2] <= 0;        WSISnum8[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[0] <= WSISnum8[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[1] <= WSISnum8[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[2] <= WSISnum8[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[0] <= WSISnum8[0] + 1; 
                        WSISnum8[1] <= WSISnum8[1] + 1; 
                        WSISnum8[2] <= WSISnum8[2] + 1; 
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[0] <= WSISnum8[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[2] <= WSISnum8[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[0] <= WSISnum8[0] + 1; 
                        WSISnum8[2] <= WSISnum8[2] + 1; 
                    end
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            3:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[0] <= WSISnum8[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[0] <= WSISnum8[0] + 1; 
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                end
            end
            default:begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[0] <= WSISnum8[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[1] <= WSISnum8[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[2] <= WSISnum8[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[0] <= WSISnum8[0] + 1; 
                        WSISnum8[1] <= WSISnum8[1] + 1; 
                        WSISnum8[2] <= WSISnum8[2] + 1; 
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[1] <= WSISnum8[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[1] <= WSISnum8[1] + 1; 
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                end
            end
            3:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[2] <= WSISnum8[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[2] <= WSISnum8[2] + 1; 
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            4:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                end
            end
            5:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            6:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            7:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            default:begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[0] <= WSISnum8[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[1] <= WSISnum8[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[2] <= WSISnum8[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[0] <= WSISnum8[0] + 1; 
                        WSISnum8[1] <= WSISnum8[1] + 1; 
                        WSISnum8[2] <= WSISnum8[2] + 1; 
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[1] <= WSISnum8[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[1] <= WSISnum8[1] + 1; 
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                end
            end
            3:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[0] <= WSISnum8[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[0] <= WSISnum8[0] + 1; 
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                end
            end
            4:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[1] <= WSISnum8[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[1] <= WSISnum8[1] + 1; 
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            5:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[2] <= WSISnum8[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[2] <= WSISnum8[2] + 1; 
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            6:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum8[3] <= WSISnum8[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum8[3] <= WSISnum8[3] + 1; 
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                end
            end
            7:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            8:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            9:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            10:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            11:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            12:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            13:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            14:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            15:begin
                if(OS_counter8 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;

                end else begin
                    if((OS_counter8 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
                end
            end
            default:begin
                        WSISnum8[0] <= WSISnum7[4] + 3;
                        WSISnum8[1] <= WSISnum8[0] + 3;
                        WSISnum8[2] <= WSISnum8[1] + 3;
                        WSISnum8[3] <= WSISnum8[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第9個開始的state
    if(rst)begin
        WSISnum9[0] <= 0;        WSISnum9[1] <= 0;        WSISnum9[2] <= 0;        WSISnum9[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[1] <= WSISnum9[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[2] <= WSISnum9[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[3] <= WSISnum9[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[1] <= WSISnum9[1] + 1; 
                        WSISnum9[2] <= WSISnum9[2] + 1; 
                        WSISnum9[3] <= WSISnum9[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[2] <= WSISnum9[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[2] <= WSISnum9[2] + 1; 
                    end
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            3:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[3] <= WSISnum9[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[3] <= WSISnum9[3] + 1; 
                    end
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                end
            end
            default:begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[1] <= WSISnum9[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[2] <= WSISnum9[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[3] <= WSISnum9[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[1] <= WSISnum9[1] + 1; 
                        WSISnum9[2] <= WSISnum9[2] + 1; 
                        WSISnum9[3] <= WSISnum9[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[2] <= WSISnum9[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[2] <= WSISnum9[2] + 1; 
                    end
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            3:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[3] <= WSISnum9[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[3] <= WSISnum9[3] + 1; 
                    end
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                end
            end
            default:begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[1] <= WSISnum9[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[2] <= WSISnum9[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[3] <= WSISnum9[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[1] <= WSISnum9[1] + 1; 
                        WSISnum9[2] <= WSISnum9[2] + 1; 
                        WSISnum9[3] <= WSISnum9[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[0] <= WSISnum9[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum9[2] <= WSISnum9[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[0] <= WSISnum9[0] + 1; 
                        WSISnum9[2] <= WSISnum9[2] + 1; 
                    end
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            3:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[1] <= WSISnum9[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[1] <= WSISnum9[1] + 1; 
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            4:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[2] <= WSISnum9[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[2] <= WSISnum9[2] + 1; 
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            5:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum9[3] <= WSISnum9[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum9[3] <= WSISnum9[3] + 1; 
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                end
            end
            6:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            7:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            8:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            9:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            10:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            11:begin
                if(OS_counter9 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;

                end else begin
                    if((OS_counter9 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
                end
            end
            default:begin
                        WSISnum9[0] <= WSISnum8[4] + 3;
                        WSISnum9[1] <= WSISnum9[0] + 3;
                        WSISnum9[2] <= WSISnum9[1] + 3;
                        WSISnum9[3] <= WSISnum9[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第10個開始的state
    if(rst)begin
        WSISnum10[0] <= 0;        WSISnum10[1] <= 0;        WSISnum10[2] <= 0;        WSISnum10[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[0] <= WSISnum10[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[1] <= WSISnum10[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[2] <= WSISnum10[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[0] <= WSISnum10[0] + 1; 
                        WSISnum10[1] <= WSISnum10[1] + 1; 
                        WSISnum10[2] <= WSISnum10[2] + 1; 
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[0] <= WSISnum10[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[2] <= WSISnum10[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[0] <= WSISnum10[0] + 1; 
                        WSISnum10[2] <= WSISnum10[2] + 1; 
                    end
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            3:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[0] <= WSISnum10[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[0] <= WSISnum10[0] + 1; 
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                end
            end
            default:begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[0] <= WSISnum10[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[1] <= WSISnum10[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[2] <= WSISnum10[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[0] <= WSISnum10[0] + 1; 
                        WSISnum10[1] <= WSISnum10[1] + 1; 
                        WSISnum10[2] <= WSISnum10[2] + 1; 
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[1] <= WSISnum10[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[1] <= WSISnum10[1] + 1; 
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                end
            end
            3:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[2] <= WSISnum10[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[2] <= WSISnum10[2] + 1; 
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            4:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                end
            end
            5:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            6:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            7:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            default:begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[0] <= WSISnum10[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[1] <= WSISnum10[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[2] <= WSISnum10[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[0] <= WSISnum10[0] + 1; 
                        WSISnum10[1] <= WSISnum10[1] + 1; 
                        WSISnum10[2] <= WSISnum10[2] + 1; 
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[1] <= WSISnum10[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[1] <= WSISnum10[1] + 1; 
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                end
            end
            3:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[2] <= WSISnum10[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[2] <= WSISnum10[2] + 1; 
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            4:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum10[3] <= WSISnum10[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum10[3] <= WSISnum10[3] + 1; 
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                end
            end
            5:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            6:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            7:begin
                if(OS_counter10 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;

                end else begin
                    if((OS_counter10 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
                end
            end
            default:begin
                        WSISnum10[0] <= WSISnum9[4] + 3;
                        WSISnum10[1] <= WSISnum10[0] + 3;
                        WSISnum10[2] <= WSISnum10[1] + 3;
                        WSISnum10[3] <= WSISnum10[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第11個開始的state
    if(rst)begin
        WSISnum11[0] <= 0;        WSISnum11[1] <= 0;        WSISnum11[2] <= 0;        WSISnum11[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[1] <= WSISnum11[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[2] <= WSISnum11[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[3] <= WSISnum11[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[1] <= WSISnum11[1] + 1; 
                        WSISnum11[2] <= WSISnum11[2] + 1; 
                        WSISnum11[3] <= WSISnum11[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[3] <= WSISnum11[2] + 3;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[2] <= WSISnum11[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[2] <= WSISnum11[2] + 1; 
                    end
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[3] <= WSISnum11[2] + 3;
                end
            end
            3:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                        WSISnum11[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[3] <= WSISnum11[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[3] <= WSISnum11[3] + 1; 
                    end
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                end
            end
            default:begin
                        WSISnum11[0] <= WSISnum10[4] + 3;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                        WSISnum11[3] <= WSISnum11[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[1] <= WSISnum11[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[2] <= WSISnum11[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[3] <= WSISnum11[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[1] <= WSISnum11[1] + 1; 
                        WSISnum11[2] <= WSISnum11[2] + 1; 
                        WSISnum11[3] <= WSISnum11[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[3] <= WSISnum11[2] + 3;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[2] <= WSISnum11[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[2] <= WSISnum11[2] + 1; 
                    end
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[3] <= WSISnum11[2] + 3;
                end
            end
            3:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                        WSISnum11[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[3] <= WSISnum11[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[3] <= WSISnum11[3] + 1; 
                    end
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                end
            end
            default:begin
                        WSISnum11[0] <= WSISnum10[4] + 3;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                        WSISnum11[3] <= WSISnum11[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[1] <= WSISnum11[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[2] <= WSISnum11[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[3] <= WSISnum11[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[1] <= WSISnum11[1] + 1; 
                        WSISnum11[2] <= WSISnum11[2] + 1; 
                        WSISnum11[3] <= WSISnum11[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[3] <= WSISnum11[2] + 3;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[2] <= WSISnum11[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[2] <= WSISnum11[2] + 1; 
                    end
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[3] <= WSISnum11[2] + 3;
                end
            end
            3:begin
                if(OS_counter11 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum11[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                        WSISnum11[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter11 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum11[0] <= WSISnum11[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum11[3] <= WSISnum11[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum11[0] <= WSISnum11[0] + 1; 
                        WSISnum11[3] <= WSISnum11[3] + 1; 
                    end
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                end
            end
            default:begin
                        WSISnum11[0] <= WSISnum10[4] + 3;
                        WSISnum11[1] <= WSISnum11[0] + 3;
                        WSISnum11[2] <= WSISnum11[1] + 3;
                        WSISnum11[3] <= WSISnum11[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第12個開始的state
    if(rst)begin
        WSISnum12[0] <= 0;        WSISnum12[1] <= 0;        WSISnum12[2] <= 0;        WSISnum12[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[0] <= WSISnum12[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[1] <= WSISnum12[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[2] <= WSISnum12[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[0] <= WSISnum12[0] + 1; 
                        WSISnum12[1] <= WSISnum12[1] + 1; 
                        WSISnum12[2] <= WSISnum12[2] + 1; 
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[0] <= WSISnum12[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[2] <= WSISnum12[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[0] <= WSISnum12[0] + 1; 
                        WSISnum12[2] <= WSISnum12[2] + 1; 
                    end
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            3:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[0] <= WSISnum12[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[0] <= WSISnum12[0] + 1; 
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                end
            end
            default:begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[0] <= WSISnum12[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[1] <= WSISnum12[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[2] <= WSISnum12[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[0] <= WSISnum12[0] + 1; 
                        WSISnum12[1] <= WSISnum12[1] + 1; 
                        WSISnum12[2] <= WSISnum12[2] + 1; 
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[1] <= WSISnum12[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[1] <= WSISnum12[1] + 1; 
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                end
            end
            3:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[2] <= WSISnum12[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[2] <= WSISnum12[2] + 1; 
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            4:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                end
            end
            5:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            6:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            7:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            default:begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[0] <= WSISnum12[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[1] <= WSISnum12[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[2] <= WSISnum12[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[0] <= WSISnum12[0] + 1; 
                        WSISnum12[1] <= WSISnum12[1] + 1; 
                        WSISnum12[2] <= WSISnum12[2] + 1; 
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[1] <= WSISnum12[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[1] <= WSISnum12[1] + 1; 
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                end
            end
            3:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[0] <= WSISnum12[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[0] <= WSISnum12[0] + 1; 
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                end
            end
            4:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[1] <= WSISnum12[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[1] <= WSISnum12[1] + 1; 
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            5:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[2] <= WSISnum12[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[2] <= WSISnum12[2] + 1; 
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            6:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum12[3] <= WSISnum12[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum12[3] <= WSISnum12[3] + 1; 
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                end
            end
            7:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            8:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            9:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            10:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            11:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            12:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            13:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            14:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            15:begin
                if(OS_counter12 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;

                end else begin
                    if((OS_counter12 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
                end
            end
            default:begin
                        WSISnum12[0] <= WSISnum11[4] + 3;
                        WSISnum12[1] <= WSISnum12[0] + 3;
                        WSISnum12[2] <= WSISnum12[1] + 3;
                        WSISnum12[3] <= WSISnum12[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第13個開始的state
    if(rst)begin
        WSISnum13[0] <= 0;        WSISnum13[1] <= 0;        WSISnum13[2] <= 0;        WSISnum13[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[1] <= WSISnum13[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[2] <= WSISnum13[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[3] <= WSISnum13[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[1] <= WSISnum13[1] + 1; 
                        WSISnum13[2] <= WSISnum13[2] + 1; 
                        WSISnum13[3] <= WSISnum13[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[2] <= WSISnum13[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[2] <= WSISnum13[2] + 1; 
                    end
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            3:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[3] <= WSISnum13[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[3] <= WSISnum13[3] + 1; 
                    end
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                end
            end
            default:begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[1] <= WSISnum13[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[2] <= WSISnum13[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[3] <= WSISnum13[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[1] <= WSISnum13[1] + 1; 
                        WSISnum13[2] <= WSISnum13[2] + 1; 
                        WSISnum13[3] <= WSISnum13[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[2] <= WSISnum13[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[2] <= WSISnum13[2] + 1; 
                    end
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            3:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[3] <= WSISnum13[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[3] <= WSISnum13[3] + 1; 
                    end
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                end
            end
            default:begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[1] <= WSISnum13[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[2] <= WSISnum13[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[3] <= WSISnum13[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[1] <= WSISnum13[1] + 1; 
                        WSISnum13[2] <= WSISnum13[2] + 1; 
                        WSISnum13[3] <= WSISnum13[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[0] <= WSISnum13[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum13[2] <= WSISnum13[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[0] <= WSISnum13[0] + 1; 
                        WSISnum13[2] <= WSISnum13[2] + 1; 
                    end
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            3:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[1] <= WSISnum13[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[1] <= WSISnum13[1] + 1; 
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            4:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[2] <= WSISnum13[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[2] <= WSISnum13[2] + 1; 
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            5:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum13[3] <= WSISnum13[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum13[3] <= WSISnum13[3] + 1; 
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                end
            end
            6:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            7:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            8:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            9:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            10:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            11:begin
                if(OS_counter13 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;

                end else begin
                    if((OS_counter13 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
                end
            end
            default:begin
                        WSISnum13[0] <= WSISnum12[4] + 3;
                        WSISnum13[1] <= WSISnum13[0] + 3;
                        WSISnum13[2] <= WSISnum13[1] + 3;
                        WSISnum13[3] <= WSISnum13[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第14個開始的state
    if(rst)begin
        WSISnum14[0] <= 0;        WSISnum14[1] <= 0;        WSISnum14[2] <= 0;        WSISnum14[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[0] <= WSISnum14[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[1] <= WSISnum14[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[2] <= WSISnum14[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[0] <= WSISnum14[0] + 1; 
                        WSISnum14[1] <= WSISnum14[1] + 1; 
                        WSISnum14[2] <= WSISnum14[2] + 1; 
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[0] <= WSISnum14[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[2] <= WSISnum14[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[0] <= WSISnum14[0] + 1; 
                        WSISnum14[2] <= WSISnum14[2] + 1; 
                    end
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            3:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[0] <= WSISnum14[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[0] <= WSISnum14[0] + 1; 
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                end
            end
            default:begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[0] <= WSISnum14[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[1] <= WSISnum14[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[2] <= WSISnum14[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[0] <= WSISnum14[0] + 1; 
                        WSISnum14[1] <= WSISnum14[1] + 1; 
                        WSISnum14[2] <= WSISnum14[2] + 1; 
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[1] <= WSISnum14[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[1] <= WSISnum14[1] + 1; 
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                end
            end
            3:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[2] <= WSISnum14[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[2] <= WSISnum14[2] + 1; 
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            4:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                end
            end
            5:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            6:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            7:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            default:begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[0] <= WSISnum14[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[1] <= WSISnum14[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[2] <= WSISnum14[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[0] <= WSISnum14[0] + 1; 
                        WSISnum14[1] <= WSISnum14[1] + 1; 
                        WSISnum14[2] <= WSISnum14[2] + 1; 
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[1] <= WSISnum14[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[1] <= WSISnum14[1] + 1; 
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                end
            end
            3:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[2] <= WSISnum14[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[2] <= WSISnum14[2] + 1; 
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            4:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum14[3] <= WSISnum14[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum14[3] <= WSISnum14[3] + 1; 
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                end
            end
            5:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            6:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            7:begin
                if(OS_counter14 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;

                end else begin
                    if((OS_counter14 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                    end else begin
                    end
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
                end
            end
            default:begin
                        WSISnum14[0] <= WSISnum13[4] + 3;
                        WSISnum14[1] <= WSISnum14[0] + 3;
                        WSISnum14[2] <= WSISnum14[1] + 3;
                        WSISnum14[3] <= WSISnum14[2] + 3;
            end
            endcase
        end
    end
end
always_ff@( posedge clk or posedge rst ) begin // WS 第15個開始的state
    if(rst)begin
        WSISnum15[0] <= 0;        WSISnum15[1] <= 0;        WSISnum15[2] <= 0;        WSISnum15[3] <= 0;
    end else begin
        if(PE_size/size==4)begin
            case(kernelsize)
            1:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[1] <= WSISnum15[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[2] <= WSISnum15[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[3] <= WSISnum15[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[1] <= WSISnum15[1] + 1; 
                        WSISnum15[2] <= WSISnum15[2] + 1; 
                        WSISnum15[3] <= WSISnum15[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[3] <= WSISnum15[2] + 3;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[2] <= WSISnum15[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[2] <= WSISnum15[2] + 1; 
                    end
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[3] <= WSISnum15[2] + 3;
                end
            end
            3:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                        WSISnum15[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[3] <= WSISnum15[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[3] <= WSISnum15[3] + 1; 
                    end
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                end
            end
            default:begin
                        WSISnum15[0] <= WSISnum14[4] + 3;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                        WSISnum15[3] <= WSISnum15[2] + 3;
            end
            endcase
        else if(PE_size/size==2)begin
            case(kernelsize)
            1:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[1] <= WSISnum15[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[2] <= WSISnum15[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[3] <= WSISnum15[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[1] <= WSISnum15[1] + 1; 
                        WSISnum15[2] <= WSISnum15[2] + 1; 
                        WSISnum15[3] <= WSISnum15[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[3] <= WSISnum15[2] + 3;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[2] <= WSISnum15[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[2] <= WSISnum15[2] + 1; 
                    end
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[3] <= WSISnum15[2] + 3;
                end
            end
            3:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                        WSISnum15[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[3] <= WSISnum15[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[3] <= WSISnum15[3] + 1; 
                    end
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                end
            end
            default:begin
                        WSISnum15[0] <= WSISnum14[4] + 3;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                        WSISnum15[3] <= WSISnum15[2] + 3;
            end
            endcase
        else if(PE_size/size==1)begin
            case(kernelsize)
            1:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[1] <= WSISnum15[1] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[2] <= WSISnum15[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[3] <= WSISnum15[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[1] <= WSISnum15[1] + 1; 
                        WSISnum15[2] <= WSISnum15[2] + 1; 
                        WSISnum15[3] <= WSISnum15[3] + 1; 
                    end
                end
            end
            2:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[3] <= WSISnum15[2] + 3;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[2] <= WSISnum15[2] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[2] <= WSISnum15[2] + 1; 
                    end
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[3] <= WSISnum15[2] + 3;
                end
            end
            3:begin
                if(OS_counter15 <= WS_width*kernelsize + kernelsize)begin
                        WSISnum15[0] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                        WSISnum15[3] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;

                end else begin
                    if((OS_counter15 - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin                        WSISnum15[0] <= WSISnum15[0] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                        WSISnum15[3] <= WSISnum15[3] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);
                    end else begin
                        WSISnum15[0] <= WSISnum15[0] + 1; 
                        WSISnum15[3] <= WSISnum15[3] + 1; 
                    end
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                end
            end
            default:begin
                        WSISnum15[0] <= WSISnum14[4] + 3;
                        WSISnum15[1] <= WSISnum15[0] + 3;
                        WSISnum15[2] <= WSISnum15[1] + 3;
                        WSISnum15[3] <= WSISnum15[2] + 3;
            end
            endcase
        end
    end
end
