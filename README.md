# genotyping
<h5>20170620: Need to fix the internal code according to this</h5>

<h5>Importing files</h5>

The script assumes that you have a _hapmap_ file. If you do not have a _hapmap_ file then use [TASSEL](https://www.maizegenetics.net/tassel) to convert your file and save as _hapmap.txt_ file type.



```
geno_male<-function(sub){
  ro=nrow(sub)
  cl=ncol(sub)
  sub[is.na(sub)]<- "N"
  out<-matrix(0,nrow=ro, ncol=cl)
  for (i in 1:ro){
    for (j in 1:11){
      out[i,j]<-as.character(sub[i,j])
    }
  }
  
  for (i in 1:ro){
    for (j in 12:cl){
      if (as.character(sub[i,j])==as.character(sub$Parent1Name[[i]])) {
        out[i,j]<- as.character("nn")
      }else if (as.character(sub[i,j])==as.character(sub$Parent2Name[[i]])) {
        out[i,j]<- as.character("np")
      }else
        out[i,j]<- as.character("--")
    }
  }
  colnames(out)<-names(sub)
  rownames(out)<-rownames(sub)
  print(out)
}

male<-read.csv("uneak_male_file1.csv", header=T, row.names=NULL)
filemale<- geno_male(male)
write.table(filemale,file="male_lux.txt", row.names=FALSE)
```
