#提取文件
rm(list=ls())
a<- data.table::fread("ALL_sample_data.txt")

a<- a[,-c(2:17)]
a<- as.data.frame(a)
i<- 2
n<- seq(5,34,3)
while(i<32){
  for (j in n){
    meta_1<- a[,c(1,i,i+1,i+2)]
    meta_2<- a[,c(j,j+1,j+2)]
    meta<- cbind(meta_1,meta_2)
    name_1<- ((i+2)-1)/3
    name_2<- ((j+2)-1)/3
    name<- paste0("DS",name_1,"vs",name_2)
    write.table(meta,file=name,sep="\t",row.names = F,quote=F)
  }
  n<- n[-1]
  print(n)
  print(i)
  i<- i+3
}


