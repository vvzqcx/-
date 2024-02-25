#OS_counter[Layer][Pe part]
for a in range(2):
    print(
    "    integer j"+str(a)+",jk"+str(a)+";\n"
    "    always_ff @( posedge clk or posedge rst ) begin//OS_counter的運作 要分成不同Layer進行操作\n"
    "        if(rst)begin\n"
    "            for ( j"+str(a)+"=0 ; j"+str(a)+"<1 ; j"+str(a)+"=j"+str(a)+"+1) begin\n"
    "                for ( jk"+str(a)+"=0 ; jk"+str(a)+"<16 ; jk"+str(a)+"=jk"+str(a)+"+1) begin\n"
    "                    OS_counter[j"+str(a)+"][jk"+str(a)+"] <= 0;\n"
    "                end\n"
    "            end\n"
    "        end else begin\n"
    "            for ( j"+str(a)+"=0 ; j"+str(a)+"1 ; j"+str(a)+"=j"+str(a)+"+1) begin\n"
    "                for ( jk"+str(a)+"=0 ; jk"+str(a)+"<16 ; jk"+str(a)+"=jk"+str(a)+"+1) begin\n"
    "                    if(state[j"+str(a)+"])begin\n"
    "                        OS_counter[j"+str(a)+"][jk"+str(a)+"] <= OS_counter[j"+str(a)+"][jk"+str(a)+"] + 1;\n"
    "                    end else begin\n"
    "                        OS_counter[j"+str(a)+"][jk"+str(a)+"] <= 0;\n"
    "                end\n"
    "            end\n"
    "        end\n"
    "    end\n"
    )
