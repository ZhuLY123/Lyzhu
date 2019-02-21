# -*- coding: utf-8 -*-
"""
Created on Wed Feb 20 10:16:01 2019

@author: lyzhu
"""

import os 
import random

def getinfo(filepath_list):
    #read file path
    path_list = os.listdir(filepath_list)
    #get the information of all files
    sources=[]
    for file in path_list:
        file_path = os.path.join(filepath_list,file)
        f1=open(file_path,"r",errors="ignore",encoding="gbk")
        #return a list of rows as elements
        source=f1.read().splitlines()
        sources.append(source)
        f1.close()
    return sources   

def estimatesameword(error_path, yuliaoku_pathlist):
    word_file_list=[]
    for word in getinfo(error_path):
        lists=[]#store the specific words to judge
        for line in getinfo(yuliaoku_pathlist):
            if word in line:
                lists.append(line)
                #to judge if has enough words or not
                if len(lists)==0:
                    print("does not exist")
                if len(lists)>=10000:
                    word_list = lists[:10000]
                else:
                    num_line = 10000-len(lists)
                    print("still need" + num_line+"words")
                    #estimate again to produce enough words
                    if num_line> len(lists):
                        while True:
                            word_list.extend(word_list)
                            #judge again
                            if len(word_list)>=10000:
                                word_list = word_list[:10000]
                                break
                            
                    else:
                        #if the number of the lists can cover that of num_line, select a specific number of characters from word_list
                        word_list+=random.sample(word_list,num_line)
                    word_file_list.append(word_list)
    return word_file_list
    
    
def writepath(error_path, yuliaoku_pathlist,target_path):
    lists=estimatesameword(error_path, yuliaoku_pathlist)
    idx=0
    for i in range(len(lists)):
        txt_list = os.listdir(error_path)
        name = os.path.splitext(txt_list[idx])[0]+".result.txt"
        print("name:",name)
        target_name=os.path.join(target_path,name)
        print("target_name:",target_name)
        target_file=open(target_name,"w",encoding="gbk")
        for infos in lists[i]:
            for info in infos:
                target_file.write(str(info))
                target_file.write("\n")
        target_file.close()
        idx=idx+1
    
def main():
    yuliaoku_pathlist = r'../../'
    error_path =  r'./txt'
    target_path = ''
    writepath(error_path, yuliaoku_pathlist,target_path)
    
if __name__=="__main__":
    main()    
        