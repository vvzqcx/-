import math

layer = 1
kernelsize = 3
partition = 4
partition_type = []
while partition>=1:
    partition_type.append(partition)
    partition = partition / 2
partition = 4
#print(partition_type)
block = []
for a in range(int(partition*partition)):
    block.append(a)
print(block)
#print(block)
PE_size = 16

path = 'OSIS.txt'
with open(path, 'w') as f:
    f.write("logic [9:0]")
    for a in range(int(partition*partition)-1):
        f.write("OSISnum"+str(a)+"["+str(int(PE_size/partition)-1)+":0],") 
    f.write("OSISnum"+str(partition*partition-1)+"["+str(int(PE_size/partition)-1)+":0];\n")
    f.write("logic [9:0]")
    for a in range(int(partition*partition)-1):
        f.write("OSWSnum"+str(a)+"["+str(int(PE_size/partition)-1)+":0],") 
    f.write("OSWSnum"+str(partition*partition-1)+"["+str(int(PE_size/partition)-1)+":0];\n")

    for block_num in block:#每一個BLOCK分開操作
        f.write(
        "always_ff@( posedge clk or posedge rst ) begin // 第"+str(block_num)+"個OS的兩個num\n"
        "    if(rst)begin\n")
    #初始化
        for a in range(int(PE_size/partition)):
            if(a==0):
                f.write("        OSISnum"+str(block_num)+"["+str(a)+"] <= 0;")
            else:
                f.write(" OSISnum"+str(block_num)+"["+str(a)+"] <= 0;")
        for a in range(int(PE_size/partition)):
            if(a==0):
                f.write("\n        OSWSnum"+str(block_num)+"["+str(a)+"] <= 0;")
            else:
                f.write(" OSWSnum"+str(block_num)+"["+str(a)+"] <= 0;")
    #分stste操作
        f.write('\n    end else begin\n')
        f.write("        if(state"+str(block_num)+")begin\n")

        for a in range(int(PE_size/partition)):
            if(a==0):
                f.write("            if(OS_counter"+str(block_num)+" == "+str(a)+")begin\n")
                f.write("                OSISnum"+str(block_num)+"["+str(a)+"] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*("+str(block_num+1)+")/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4);\n")
                f.write("                OSWSnum"+str(block_num)+"["+str(a)+"] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4);\n")
            else:
                f.write("\n            end else if(OS_counter"+str(block_num)+" == "+str(a)+")begin\n")
                for b in range(a+1):
                    if(b==a):
                        f.write("                OSISnum"+str(block_num)+"["+str(b)+"] <= (round*layer_num*(kernelsize**4)) + ((layer_num-1)*("+str(block_num+1)+")/((PE_size/size)*(PE_size/size)+1))*(kernelsize**4) + "+str(b)+"*kernelsize*kernelsize;")
                        f.write("                OSWSnum"+str(block_num)+"["+str(b)+"] <= ((input_totalnum-total_num)/total_inputmapnum)*(kernelsize**4) + "+str(b)+"*kernelsize*kernelsize;")
                    else:
                        f.write("                OSISnum"+str(block_num)+"["+str(b)+"] <= OSISnum"+str(block_num)+"["+str(b)+"] + 1;")
                        f.write("                OSWSnum"+str(block_num)+"["+str(b)+"] <= OSWSnum"+str(block_num)+"["+str(b)+"] + 1;")
        f.write("\n            end else begin\n")
        for a in range(int(PE_size/partition)):
                f.write("                OSISnum"+str(block_num)+"["+str(a)+"] <= OSISnum"+str(block_num)+"["+str(a)+"] + 1;")
                f.write("                OSWSnum"+str(block_num)+"["+str(a)+"] <= OSWSnum"+str(block_num)+"["+str(a)+"] + 1;\n")
        f.write("            end\n")
    #state沒有在運作就重置
        f.write("        end else begin\n")
        for a in range(int(PE_size/partition)):
            if(a==0):
                f.write("            OSISnum"+str(block_num)+"["+str(a)+"] <= 0;")
            else:
                f.write(" OSISnum"+str(block_num)+"["+str(a)+"] <= 0;")
        f.write("\n")
        for a in range(int(PE_size/partition)):
            if(a==0):
                f.write("\n            OSWSnum"+str(block_num)+"["+str(a)+"] <= 0;")
            else:
                f.write(" OSWSnum"+str(block_num)+"["+str(a)+"] <= 0;")
        f.write("\n        end\n")
        f.write("    end\n")
        f.write("end\n")
        f.write("\n")
