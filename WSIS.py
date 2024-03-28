import math

layer = 1
kernelsize = 3
partition = 4
partition_type = []
while partition>=1:
    partition_type.append(partition)
    partition = partition / 2
partition = 4
print(partition_type)
block = []
for a in range(int(partition*partition)):
    block.append(a)
print(block)
PE_size = 16

path = 'WSIS.txt'
with open(path, 'w') as f:

    f.write("logic [10:0]")
    for a in range(int(partition*partition)-1):
        f.write("WSIS"+str(a)+"["+str(int(PE_size/partition)-1)+":0],") 
    f.write("WSIS"+str(partition*partition-1)+"["+str(int(PE_size/partition)-1)+":0];\n")


    for block_num in block:#每一個BLOCK分開操作
        f.write(
            "always_ff@( posedge clk or posedge rst ) begin // WS 第"+str(block_num)+"個開始的state"
            "\n    if(rst)begin\n")
        for a in range(int(PE_size/partition)):#初始化
            f.write("        WSISnum"+str(block_num)+"["+str(a)+"] <= 0;" )
        f.write("\n    end else begin\n"
        )
        for a in partition_type:#看有幾種切割的方式
            if(a==partition):
                f.write(
                "        if(PE_size/size=="+str(int(a))+")begin\n"
                "            case(kernelsize)\n"
                )
            else:
                f.write(
                "        else if(PE_size/size=="+str(int(a))+")begin\n"
                "            case(kernelsize)\n"
                )
            for b in range(1,int(int(partition/a)-block_num%int(partition/a))*int(PE_size/partition)):
                f.write("            "+str(b)+":begin\n")
                f.write("                if(OS_counter"+str(block_num)+" <= WS_width*kernelsize + kernelsize)begin\n")
                for c in range(int(PE_size/partition)):#PE中的每個WSISnum
                    if((int(partition/a)-1-(block_num%int(partition/a))+c)%b==0):
                        #f.write("                    1")
                        f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= (round*(computation_num-kernelsize*kernelsize)*kernelsize*kernelsize) + 0*kernelsize + OS_counter-WS_width*kernelsize;\n")
                    else:
                        if(c!=0):
                            #f.write("                    2")
                            f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num)+"["+str(c-1)+"] + 3;\n")
                        else :
                            #f.write("                    2")
                            f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num-1)+"["+str(int(PE_size/partition))+"] + 3;\n")
                f.write("\n                end else begin\n")
                
                f.write("                    if((OS_counter"+str(block_num)+" - WS_width*kernelsize + kernelsize)%kernelsize == 0)begin")
                for c in range(int(PE_size/partition)):#PE中的每個WSISnum
                    if((int(partition/a)-1-(block_num%int(partition/a))+c)%b==0):
                        #f.write("                    1")
                        f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num)+"["+str(c)+"] + kernelsize*kernelsize*(PE_size/size)*(PE_size/size);\n")
                f.write("                    end else begin\n")
                for c in range(int(PE_size/partition)):#PE中的每個WSISnum
                    if((int(partition/a)-1-(block_num%int(partition/a))+c)%b==0):
                        #f.write("                    1")
                        f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num)+"["+str(c)+"] + 1; \n")
                f.write("                    end\n")
                for c in range(int(PE_size/partition)):#PE中的每個WSISnum
                    if((int(partition/a)-1-(block_num%int(partition/a))+c)%b!=0):
                        if(c!=0):
                            #f.write("                    2")
                            f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num)+"["+str(c-1)+"] + 3;\n")
                        else :
                            #f.write("                    2")
                            f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num-1)+"["+str(int(PE_size/partition))+"] + 3;\n")
                f.write("                end\n")
                f.write("            end\n")
            
            f.write("            default:begin\n")           
            for c in range(int(PE_size/partition)):#PE中的每個WSISnum
                    #f.write("                    2")
                    if(c==0):
                        if block_num==0:#根本不會有這種狀況但還是設一下
                            f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num)+"["+str(c)+"]\n")
                        else:
                            f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num-1)+"["+str(int(PE_size/partition))+"] + 3;\n")
                    else:
                        f.write("                        WSISnum"+str(block_num)+"["+str(c)+"] <= WSISnum"+str(block_num)+"["+str(c-1)+"] + 3;\n")
            f.write("            end\n")
            f.write("            endcase\n")
        f.write("        end\n")
        f.write("    end\n")
        f.write("end\n")
