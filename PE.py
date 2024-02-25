###kernelsize = int(input('input kernelsize:'))
f=1#f代表的是哪一層的PE
pe_size = int(input('input PE size:'))
'''
if(pe_size%2==1):
    if(((pe_size-1)/2)%2==1):
        pe_size=pe_size-3
    else:
        pe_size=pe_size-1
else:
    if((pe_size/2)%2==1):
        pe_size=pe_size-2
    else:
        pe_size=pe_size
'''
print("PE size = ",pe_size,"\n")
counter_input = 0
counter_weight = 0
for y in range(1,pe_size+1):
    for x in range(1,pe_size+1):
        if((y%(pe_size/4))==1):#最上面那排只有最左上角那個需要有雙TSV 其他用那個聰明方法就好
            if(x%(pe_size/4)==1):
                print("PE_dual_tsv\tpe"+str(x)+str(y)+"(output_left["+str(x+1)+"]["+str(y)+"],output_left["+str(x+1)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y-1)+"],output_up["+str(x)+"]["+str(y+1)+"],",end='')
                print("output_left["+str(x)+"]["+str(y)+"],output_right["+str(x)+"]["+str(y)+"],output_up["+str(x)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y)+"],",end='')
                print("state"+str(f)+"[0],clk,OSIS[OSISnum["+str(counter_input)+"]],OSWS[OSWSnum["+str(0)+"]],tsv_out["+str(x)+"]["+str(y)+"],rst,42'd"+str(x)+",42'd"+str(y))
                print(",size,kernelsize,result["+str(x)+"]["+str(y)+"]);")
            else:
                print("PE_tsv\tpe"+str(x)+str(y)+"(42'd0,output_left["+str(x+1)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y-1)+"],42'd0,",end='')
                print("output_left["+str(x)+"]["+str(y)+"],output_right["+str(x)+"]["+str(y)+"],output_up["+str(x)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y)+"],",end='')
                print("state"+str(f)+"[0],clk,OSWS[OSWSnum["+str(counter_weight)+"]],tsv_out["+str(x)+"]["+str(y)+"],rst,42'd"+str(x)+",42'd"+str(y)+",size,kernelsize,result["+str(x)+"]["+str(y)+"]);")
            counter_weight = counter_weight + 1
            counter_input = counter_input + 1
        elif(x%(pe_size/4)==0 or y%(pe_size/4)==0):#右邊跟下面只會有weight的輸入
            print("PE_tsv\tpe"+str(x)+str(y)+"(42'd0,output_left["+str(x+1)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y-1)+"],output_up["+str(x)+"]["+str(y+1)+"],",end='')
            print("output_left["+str(x)+"]["+str(y)+"],output_right["+str(x)+"]["+str(y)+"],output_up["+str(x)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y)+"],",end='')
            print("state"+str(f)+"[0],clk,OSWS[OSWSnum["+str(counter_weight)+"]],tsv_out["+str(x)+"]["+str(y)+"],rst,42'd"+str(x)+",42'd"+str(y)+",size,kernelsize,result["+str(x)+"]["+str(y)+"]);")
            counter_weight = counter_weight + 1
        elif((y%(pe_size/4))==1):#最左邊只會有input輸入
            print("PE_tsv\tpe"+str(x)+str(y)+"(output_right["+str(x-1)+"]["+str(y)+"3],output_left["+str(x+1)+"]["+str(y)+"],42'b0,output_up["+str(x)+"]["+str(y+1)+"]",end='\t')
            print(",output_left["+str(x)+"]["+str(y)+"],output_right["+str(x)+"]["+str(y)+"],output_up["+str(x)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y)+"],",end='\t')
            print("state"+str(f)+"[0],clk,OSIS[OSISnum["+str(counter_input)+"]],tsv_out["+str(x)+"]["+str(y)+"],rst,42'd"+str(x)+",42'd"+str(y)+",size,kernelsize,result["+str(x)+"]["+str(y)+"]);")
            counter_input = counter_input + 1
        else:
            print("PE\tpe"+str(x)+str(y)+"(output_right["+str(x-1)+"]["+str(y)+"],output_left["+str(x+1)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y-1)+"],output_up["+str(x)+"]["+str(y+1)+"],",end='\t')
            print("output_left["+str(x)+"]["+str(y)+"],output_right["+str(x)+"]["+str(y)+"],output_up["+str(x)+"]["+str(y)+"],output_down["+str(x)+"]["+str(y)+"],",end='\t')
            print("state"+str(f)+"[0],clk,rst,42'd"+str(x)+",42'd"+str(y)+",size,kernelsize,result["+str(x)+"]["+str(y)+"]);")
