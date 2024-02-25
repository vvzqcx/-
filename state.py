a=2 # a代表這是第幾層的Layer

print("logic [15:0] ",end='') 
for b in range(a):#X代表總共有幾層Layer
    print("state"+str(b)+",",end='')
print(";//這樣才能用每個bit or的操作")
for b in range(a):#X代表總共有幾層Layer
    print(
    "integer f"+str(b)+";\n"
    "integer n"+str(b)+";\n"
    "always_ff @( posedge clk or posedge rst ) begin//state 操作\n"
    "    if(rst)begin\n"
    "        for(f"+str(b)+"=0 ; f"+str(b)+"<16 ; f"+str(b)+"=f"+str(b)+"+1)begin\n"
    "            state"+str(b)+"[f"+str(b)+"] <= 0;\n"
    "        end\n"
    "    end else begin\n"
    "        for(n"+str(b)+"=0 ; n"+str(b)+"<16 ; n"+str(b)+"=n"+str(b)+"+1) begin\n"
    "            if(state"+str(b)+"[n"+str(b)+"] == 0 && total_num >= "+str(b)+"*(PE_size/size["+str(b)+"])*(PE_size/size["+str(b)+"])+n"+str(b)+"%16)begin//如果PE現在沒有再進行運算而且剩下能算的input數量夠多\n"
    "                if(PE_size/size["+str(b)+"]==4)begin\n"
    "                    state"+str(b)+"[n"+str(b)+"] <= 1;\n"
    "                end else if(PE_size/size["+str(b)+"]==2)begin\n"
    "                    if(n"+str(b)+"%4==0)begin\n"
    "                        state"+str(b)+"[n"+str(b)+"] <= 1;state"+str(b)+"[n"+str(b)+"+1] <= 1;state"+str(b)+"[n"+str(b)+"+2] <= 1;state"+str(b)+"[n"+str(b)+"+3] <= 1;\n"
    "                    end else begin\n"
    "                        state"+str(b)+"[n"+str(b)+"] <= state"+str(b)+"[n"+str(b)+"];state"+str(b)+"[n"+str(b)+"+1] <= state"+str(b)+"[n"+str(b)+"+1];\n"
    "                        state"+str(b)+"[n"+str(b)+"+2] <= state"+str(b)+"[n"+str(b)+"+2];state"+str(b)+"[n"+str(b)+"+3] <= state"+str(b)+"[n"+str(b)+"+3];\n"
    "                    end\n"
    "                end else begin\n"
    "                    if(n"+str(b)+"==0)begin\n"
    "                        state"+str(b)+"[n"+str(b)+"] <= 1;state"+str(b)+"[n"+str(b)+"+1] <= 1;state"+str(b)+"[n"+str(b)+"+2] <= 1;state"+str(b)+"[n"+str(b)+"+3] <= 1;state"+str(b)+"[n"+str(b)+"+4] <= 1;state"+str(b)+"[n"+str(b)+"+5] <= 1;state"+str(b)+"[n"+str(b)+"+6] <= 1;state"+str(b)+"[n"+str(b)+"+7] <= 1;\n"
    "                        state"+str(b)+"[n"+str(b)+"+8] <= 1;state"+str(b)+"[n"+str(b)+"+9] <= 1;state"+str(b)+"[n"+str(b)+"+10] <= 1;state"+str(b)+"[n"+str(b)+"+11] <= 1;state"+str(b)+"[n"+str(b)+"+12] <= 1;state"+str(b)+"[n"+str(b)+"+13] <= 1;state"+str(b)+"[n"+str(b)+"+14] <= 1;state"+str(b)+"[n"+str(b)+"+15] <= 1;\n"
    "                    end\n"
    "                end\n"
    "            end else begin\n"
    "                if(OS_counter[n"+str(b)+"] > 4*kernelsize["+str(b)+"]*kernelsize["+str(b)+"])begin\n"
    "                    state"+str(b)+"[n"+str(b)+"] <= 0;\n"
    "                end else begin\n"
    "                    state"+str(b)+"[n"+str(b)+"] <= state"+str(b)+"[n"+str(b)+"];\n"
    "                end\n"
    "            end\n"
    "        end\n"
    "    end\n"
    "end\n"
    )
