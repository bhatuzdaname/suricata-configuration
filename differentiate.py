from collections import Counter
import natsort
import sys
def gen_sum(filename):
    summary=[]
    f=open(filename,"r")
    for line in f:
        line=line.strip()
        if line=="":
            continue
        if(len(line.split("//",1))==2):
            line=line.split("//",1)[1]
        line=line.split("/",1)[0]
        line=line.split(":",1)[0]
        if line not in summary:
            summary.append(line)
    return summary

suricata=gen_sum("http.log")
squid=gen_sum("access.log")

for i in squid:
    if i not in suricata:
        print i
